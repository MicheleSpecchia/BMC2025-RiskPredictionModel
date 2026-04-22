find_project_root <- function(start = getwd()) {
  current <- normalizePath(start, winslash = "/", mustWork = TRUE)
  repeat {
    if (file.exists(file.path(current, "pipeline.R")) && dir.exists(file.path(current, "data"))) {
      return(current)
    }
    parent <- dirname(current)
    if (identical(parent, current)) stop("Project root not found.")
    current <- parent
  }
}

project_root <- find_project_root()
setwd(project_root)

required_files <- c(
  "pipeline.R",
  "install.R",
  "cv.R",
  "ddop_utility.R",
  "notebooks/analisi_base.ipynb",
  "notebooks/analisi_base.qmd",
  "data/dataset.sav"
)

missing_files <- required_files[!file.exists(required_files)]
if (length(missing_files) > 0) {
  stop("Missing required files: ", paste(missing_files, collapse = ", "))
}

if (!requireNamespace("quarto", quietly = TRUE)) {
  message("R package `quarto` not installed (optional).")
}

if (nzchar(Sys.which("quarto"))) {
  message("Quarto CLI found.")
} else {
  message("Quarto CLI not found.")
}

if (nzchar(Sys.which("python"))) {
  message("Python found.")
} else {
  message("Python not found.")
}

message("Environment checks completed.")
