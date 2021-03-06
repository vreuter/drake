# library(testthat); library(devtools); load_all()
context("import-file")

test_that("responses to imported file", {
  dclean()
  config = dbug()
  expect_output(check(plan = config$plan, envir = config$envir))
  expect_error(check(plan = config$plan[-1,], envir = config$envir))
  expect_silent(check(plan = config$plan[c(-1, -6),], 
    envir = config$envir))
  testrun(config)
  expect_true(length(justbuilt(config)) > 0)
  testrun(config)
  nobuild(config)
  
  # check missing and then replace file exactly as before
  contents = readRDS("input.rds")
  unlink("input.rds")
  expect_error(check(plan = config$plan, envir = config$envir))
  expect_error(testrun(config))
  saveRDS(contents, "input.rds")
  testrun(config)
  nobuild(config)
  final0 = readd(final, search = FALSE)
  
  # actually change file
  saveRDS(2:10, "input.rds")
  testrun(config)
  expect_equal(justbuilt(config), c("'intermediatefile.rds'",
    "combined", "final", "myinput", "nextone"))
  expect_false(length(final0) == length(readd(final, search = FALSE)))
  dclean()
})
