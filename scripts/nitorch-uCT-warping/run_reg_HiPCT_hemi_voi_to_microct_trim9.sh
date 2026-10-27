#!/bin/bash
FIX="microct_trim9_level2.prealigned(inv).nii.gz"

nitorch register \
        -v 4 \
        -o "reg_HiPCT_uCT/" \
        @loss lcc -p 5 % \
                @@fix "$FIX" -m "mask_microct_trim9_level2.prealigned(inv).nii.gz" \
                @@mov "hemi_voi_crop_level0.prealigned(inv).nii.gz" \
        @affine affine -g \
        @nonlin svf 100 --voxel-size 200 % -f "$FIX" -p 10 % \
        @pyramid --levels 0:5
