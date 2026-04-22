find_project_root <- function(start = getwd()) {
  current <- normalizePath(start, winslash = "/", mustWork = TRUE)
  repeat {
    if (file.exists(file.path(current, "pipeline.R")) && dir.exists(file.path(current, "data"))) {
      return(current)
    }

    parent <- dirname(current)
    if (identical(parent, current)) {
      stop("Project root not found (expected pipeline.R and data/).")
    }
    current <- parent
  }
}

args <- commandArgs(trailingOnly = TRUE)
register_kernel <- any(args == "--register-kernel")

project_root <- find_project_root()
setwd(project_root)

source("install.R")

if (register_kernel) {
  if (!requireNamespace("IRkernel", quietly = TRUE)) {
    install.packages("IRkernel")
  }
  IRkernel::installspec(user = TRUE)
  message("IRkernel registered for current user.")
}

message("Environment setup completed.")
