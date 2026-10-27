# nitorch-uCT-warping

sub-Hb1: scripts to extract a volume of interest (VOI) from the HiP-CT left hemisphere scan of sub-Hb1, prealign it, and register it to the microCT scan.

Source data: DANDI asset `sourcedata/raw/sub-Hb1/micr/sub-Hb1_sample-lefthemi_acq-zoom2_XPCT.ome.zarr`
(`https://dandiarchive.s3.amazonaws.com/zarr/0a89ff02-90c4-4d3d-8275-8bc8ee140715/`).

## Steps

Run in order, from a directory holding the inputs:

| Script | Input | Output |
|---|---|---|
| `extract_crop.py` | OME-Zarr level 0 (2.201 µm) | `hemi_voi_crop_level0.nii.gz` |
| `reslice_hemi_voi_crop.sh` | crop + `I74_brain_left_hemisphere_VOI-2_2.201um_bm18.lta` | `hemi_voi_crop_level0.prealigned(inv).nii.gz` |
| `run_reg_HiPCT_hemi_voi_to_microct_trim9.sh` | prealigned crop + prealigned microCT and mask | `reg_HiPCT_uCT/` (affine + svf) |

- The crop spans voxels `(3140, 4441, 8558)` to `(3793, 5094, 9226)` (x, y, z) of level 0, i.e. 653 × 653 × 668 voxels.
- `nitorch reslice -il` only updates the header (no resampling).
- `microct_trim9.lta` is the prealignment of the microCT; its `.prealigned(inv)` image and mask are made with `nitorch reslice -il` in the same way.

## Environment

- [`nitorch`](https://github.com/balbasty/nitorch) (commit `477f281`)
- [`nifti-zarr`](https://github.com/neuroscales/nifti-zarr-py) 1.0.0rc8 (imported as `niizarr`), `nibabel`
