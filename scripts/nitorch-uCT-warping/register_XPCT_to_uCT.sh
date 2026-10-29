#!/bin/bash
FIX="sub-Hb1_sample-lefthemi+ICblock+punch1+piece1+trim9_acq-view1_desc-masked+level2+prealigned_uCT.nii.gz"

nitorch register \
        -v 1 \
        -o "sub-Hb1_from-XPCT_to-uCT/" \
        @loss lcc -p 5 % \
                @@fix "$FIX" -m "sub-Hb1_sample-lefthemi+ICblock+punch1+piece1+trim9_acq-view1_desc-level2+prealigned_mask.nii.gz" \
                @@mov "sub-Hb1_sample-lefthemi_acq-zoom2_desc-crop+prealigned_XPCT.nii.gz" \
        @affine affine -g \
        @nonlin svf 0.03 --voxel-size 200 % -f "$FIX" -p 10 % \
        @pyramid --levels 0:5
