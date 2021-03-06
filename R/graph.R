#' @title Function \code{plot_graph}
#' @description Plot the dependency structure of your workflow
#' @export
#' @param plan workflow plan data frame, same as for function 
#' \code{\link{make}()}.
#' @param targets names of targets to bulid, same as for function
#' \code{\link{make}()}.
#' @param envir environment to import from, same as for function
#' \code{\link{make}()}.
plot_graph = function(plan, targets = plan$target, envir = parent.frame()){
  force(envir)
  build_graph(plan = plan, targets = targets, envir = envir) %>%
    plot.igraph
}

#' @title Function \code{plot_graph}
#' @description Make a graph of the dependency structure of your workflow.
#' @details This function returns an igraph object representing how
#' the targets in your workflow depend on each other. 
#' (\code{help(package = "igraph")}). To plot the graph, call
#' to \code{\link{plot.igraph}()} on your graph, or just use 
#' \code{\link{plot_graph}()} from the start.
#' @export
#' @param plan workflow plan data frame, same as for function
#' \code{\link{make}()}.
#' @param targets names of targets to bulid, same as for function
#' \code{\link{make}()}.
#' @param envir environment to import from, same as for function
#' \code{\link{make}()}.
build_graph = function(plan, targets = plan$target, 
  envir = parent.frame()){
  force(envir)
  imports = as.list(envir)
  assert_unique_names(imports = names(imports), targets = plan$target)
  import_deps = lapply(imports, import_dependencies)
  command_deps = lapply(plan$command, command_dependencies)
  names(command_deps) = plan$target
  dependency_list = c(command_deps, import_deps)
  keys = names(dependency_list)
  vertices = c(keys, unlist(dependency_list)) %>% unique
  graph = make_empty_graph() + vertices(vertices)
  for(key in keys)
    for(dependency in dependency_list[[key]])
      graph = graph + edge(dependency, key)
  ignore = lapply(targets, function(vertex)
    subcomponent(graph = graph, v = vertex, mode = "in")$name
  ) %>% unlist %>% unique %>% setdiff(x = vertices)
  graph = delete_vertices(graph, v = ignore)
  if(!is_dag(graph)) 
    stop("Workflow is circular (chicken and egg dilemma).")
  graph
}

assert_unique_names = function(imports, targets){
  if(anyDuplicated(targets)){
    duplicated = which(table(targets) > 1) %>% names
    stop("duplicate targets in workflow plan:\n", 
      multiline_message(duplicated))
  } 
  common = intersect(imports, targets)
  if(length(common))
    warning(paste("There are targets in your workflow plan that share",
      "names with imported objects from your environment/workspace.",
      "Behavior may be unpredictable.",
      "Duplicates found:\n"),
      multiline_message(common))
}
