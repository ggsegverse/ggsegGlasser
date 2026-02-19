# Create Glasser (HCP Multi-Modal Parcellation) Atlas
#
# Recreates the glasser cortical atlas from the HCP-MMP1
# annotation on fsaverage5 using ggsegExtra.
#
# The source annots are in fsaverage space and must be resampled
# to fsaverage5 first using data-raw/resample.sh (or the run_fs.R script).
#
# Requirements:
#   - FreeSurfer installed with fsaverage5 subject
#   - ggsegExtra package
#   - ggseg.formats package
#   - Resampled annots in data-raw/fsaverage5/
#
# Run with: Rscript data-raw/make_atlas.R

library(dplyr)
library(ggseg.extra)
library(ggseg.formats)

Sys.setenv(FREESURFER_HOME = "/Applications/freesurfer/7.4.1")
options(freesurfer.verbose = FALSE)
options(chromote.timeout = 120)
future::plan(future::sequential)
progressr::handlers("cli")
progressr::handlers(global = TRUE)

annot_files <- file.path(
  here::here("data-raw", "fsaverage5"),
  c("lh.HCPMMP1.annot", "rh.HCPMMP1.annot")
)

for (f in annot_files) {
  if (!file.exists(f)) {
    cli::cli_abort("Annotation not found: {.path {f}}")
  }
}

cli::cli_h1("Creating glasser cortical atlas")

atlas_raw <- create_cortical_from_annotation(
  input_annot = annot_files,
  atlas_name = "glasser",
  output_dir = "data-raw",
  tolerance = 1,
  smoothness = 2,
  skip_existing = TRUE,
  cleanup = FALSE
)

atlas_raw <- atlas_raw |>
  atlas_region_contextual("^$", "label")

glasser <- atlas_raw

cli::cli_alert_success("Atlas created with {nrow(glasser$core)} regions")
print(glasser)

brain_pals <- stats::setNames(
  list(glasser$palette),
  glasser$atlas
)
save(brain_pals, file = here::here("R/sysdata.rda"), compress = "xz")

usethis::use_data(glasser, overwrite = TRUE, compress = "xz")
cli::cli_alert_success("Saved to data/glasser.rda")
