Sys.setenv(FREESURFER_HOME = "/Applications/freesurfer/7.4.1")
Sys.setenv(SUBJECTS_DIR = "/Applications/freesurfer/7.4.1/subjects")

datadir <- "/Users/athanasm/workspace/ggseg/atlases/ggsegGlasser/data-raw"
outdir <- file.path(datadir, "fsaverage5")
dir.create(outdir, showWarnings = FALSE)

bin <- file.path(Sys.getenv("FREESURFER_HOME"), "bin", "mri_surf2surf")

for (hemi in c("lh", "rh")) {
  src <- file.path(datadir, paste0(hemi, ".HCPMMP1.annot"))
  tgt <- file.path(outdir, paste0(hemi, ".HCPMMP1.annot"))
  cat("Resampling", hemi, "...\n")
  system2(bin, args = c(
    "--srcsubject", "fsaverage",
    "--trgsubject", "fsaverage5",
    "--hemi", hemi,
    "--sval-annot", src,
    "--tval", tgt
  ))
}
cat("Done\n")
