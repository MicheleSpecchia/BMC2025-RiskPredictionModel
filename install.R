required_packages <- c(
  "tidyverse",
  "magrittr",
  "here",
  "haven",
  "labelled",
  "ggplot2",
  "gridExtra",
  "patchwork",
  "plotly",
  "gt",
  "ggalluvial",
  "officer",
  "flextable",
  "caret",
  "rpart",
  "randomForest",
  "e1071",
  "parallel",
  "doParallel",
  "GA",
  "nnet",
  "tidyr",
  "forcats",
  "RColorBrewer",
  "pROC",
  "rpart.plot",
  "rattle",
  "tidyjson"
)

set_default_cran <- function() {
  repos <- getOption("repos")
  cran_repo <- unname(repos["CRAN"])
  if (is.null(repos) || length(cran_repo) == 0 || is.na(cran_repo) || identical(cran_repo, "@CRAN@")) {
    options(repos = c(CRAN = "https://cloud.r-project.org"))
  }
}

install_missing_packages <- function(packages = required_packages) {
  set_default_cran()
  missing <- packages[!vapply(packages, requireNamespace, logical(1), quietly = TRUE)]

  if (length(missing) > 0) {
    message("Installing missing packages: ", paste(missing, collapse = ", "))
    install.packages(missing, dependencies = TRUE)
  }

  invisible(missing)
}

load_required_packages <- function(packages = required_packages) {
  failed <- packages[!vapply(
    packages,
    function(pkg) {
      suppressPackageStartupMessages(
        require(pkg, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)
      )
    },
    logical(1)
  )]

  if (length(failed) > 0) {
    stop("Unable to load packages: ", paste(failed, collapse = ", "))
  }

  invisible(TRUE)
}

setup_environment <- function(install = TRUE) {
  if (install) {
    install_missing_packages(required_packages)
  }
  load_required_packages(required_packages)
  invisible(required_packages)
}

# Preserve old behavior for scripts that only source("install.R").
setup_environment(install = TRUE)
