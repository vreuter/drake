.onLoad <- function(libname, pkgname) {
  if(file.exists(".RData")) 
    warning("Auto-saved workspace file '.RData' detected. ",
      "This is bad for reproducible code. ",
      "You can remove it with unlink('.RData').")
  invisible()
}
