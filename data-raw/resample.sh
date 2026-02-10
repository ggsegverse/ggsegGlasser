#!/bin/bash
export FREESURFER_HOME=/Applications/freesurfer/7.4.1
export SUBJECTS_DIR=$FREESURFER_HOME/subjects
mkdir -p fsaverage5

for hemi in lh rh; do
  $FREESURFER_HOME/bin/mri_surf2surf \
    --srcsubject fsaverage \
    --trgsubject fsaverage5 \
    --hemi $hemi \
    --sval-annot ${hemi}.HCPMMP1.annot \
    --tval fsaverage5/${hemi}.HCPMMP1.annot
done
