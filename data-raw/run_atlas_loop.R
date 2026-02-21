Sys.setenv(FREESURFER_HOME = "/Applications/freesurfer/7.4.1")
library(dplyr)
library(ggsegExtra)
library(ggseg.formats)
options(freesurfer.verbose = FALSE)
future::plan(future::sequential)

setwd("/Users/athanasm/workspace/ggseg/atlases/ggsegGlasser")
annot_files <- file.path("data-raw/fsaverage5", c("lh.HCPMMP1.annot", "rh.HCPMMP1.annot"))

max_attempts <- 200
for (i in seq_len(max_attempts)) {
  n_existing <- length(list.files("data-raw/glasser/snapshots/"))
  cat(sprintf("Attempt %d, existing snapshots: %d\n", i, n_existing))

  result <- tryCatch(
    create_cortical_atlas(
      input_annot = annot_files,
      atlas_name = "glasser",
      output_dir = "data-raw",
      tolerance = 1,
      smoothness = 2,
      skip_existing = TRUE,
      cleanup = FALSE
    ),
    error = function(e) {
      cat("Error:", conditionMessage(e), "\n")
      invisible(try(rgl::close3d(), silent = TRUE))
      Sys.sleep(0.5)
      NULL
    }
  )

  if (!is.null(result)) {
    cat("Success!\n")
    break
  }

  new_count <- length(list.files("data-raw/glasser/snapshots/"))
  if (new_count == n_existing) {
    cat("No progress made, stopping.\n")
    break
  }
}

if (!is.null(result)) {
  cat("Atlas created with", nrow(result$core), "regions\n")
}
