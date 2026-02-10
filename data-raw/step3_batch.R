Sys.setenv(FREESURFER_HOME = "/Applications/freesurfer/7.4.1")
library(dplyr)
library(ggsegExtra)
library(ggseg.formats)
options(freesurfer.verbose = FALSE)
future::plan(future::sequential)

setwd("/Users/athanasm/workspace/ggseg/atlases/ggsegGlasser")
annot_files <- file.path("data-raw/fsaverage5", c("lh.HCPMMP1.annot", "rh.HCPMMP1.annot"))

n_before <- length(list.files("data-raw/glasser/snapshots/"))
cat(sprintf("Existing snapshots: %d\n", n_before))

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
    try(rgl::close3d(), silent = TRUE)
    NULL
  }
)

n_after <- length(list.files("data-raw/glasser/snapshots/"))
cat(sprintf("Snapshots after: %d (added %d)\n", n_after, n_after - n_before))

if (!is.null(result)) {
  cat("SUCCESS\n")
  q(save = "no", status = 0)
} else {
  q(save = "no", status = 1)
}
