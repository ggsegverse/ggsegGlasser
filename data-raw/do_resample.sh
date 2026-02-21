#!/bin/bash
export FREESURFER_HOME=/Applications/freesurfer/7.4.1
export SUBJECTS_DIR=$FREESURFER_HOME/subjects

CMD=$FREESURFER_HOME/bin/mri_surf2surf
DIR=/Users/athanasm/workspace/ggseg/atlases/ggsegGlasser/data-raw

mkdir -p $DIR/fsaverage5

$CMD --srcsubject fsaverage --trgsubject fsaverage5 --hemi lh \
  --sval-annot $DIR/lh.HCPMMP1.annot \
  --tval $DIR/fsaverage5/lh.HCPMMP1.annot

$CMD --srcsubject fsaverage --trgsubject fsaverage5 --hemi rh \
  --sval-annot $DIR/rh.HCPMMP1.annot \
  --tval $DIR/fsaverage5/rh.HCPMMP1.annot

echo "Done"
