# Create Glasser (HCP Multi-Modal Parcellation) Atlas
#
# Recreates the glasser cortical atlas from the HCP-MMP1
# annotation on fsaverage5 using ggseg.extra.
#
# The source annots are in fsaverage space and must be resampled
# to fsaverage5 first using data-raw/resample.sh (or the run_fs.R script).
#
# Requirements:
#   - FreeSurfer installed with fsaverage5 subject
#   - ggseg.extra (>= 2.0.0.9000)
#   - ggseg.formats
#   - Resampled annots in data-raw/fsaverage5/
#
# Run with: Rscript data-raw/make_atlas.R

library(ggseg.extra)
library(ggseg.formats)

Sys.setenv(FREESURFER_HOME = "/Applications/freesurfer/7.4.1")

annot_files <- file.path(
  here::here("data-raw", "fsaverage5"),
  c("lh.HCPMMP1.annot", "rh.HCPMMP1.annot")
)

glasser <- create_cortical_from_annotation(
  input_annot = annot_files,
  atlas_name = "glasser",
  output_dir = "data-raw",
  tolerance = 0,
  skip_existing = TRUE,
  cleanup = FALSE
) |>
  atlas_region_contextual("^$|unknown", "label")

glasser$core$region <- gsub("^[LR]_", "", glasser$core$region) |>
  gsub("_ROI$", "", x = _)

print(glasser)
plot(glasser)

.glasser <- glasser
usethis::use_data(
  .glasser,
  overwrite = TRUE,
  compress = "xz",
  internal = TRUE
)
