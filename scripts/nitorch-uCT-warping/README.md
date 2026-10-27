# nitorch-uCT-warping

sub-Hb1: scripts to extract a volume of interest (VOI) from the HiP-CT (XPCT) left hemisphere scan, prealign it, and register it to the microCT (uCT) scan.

Source data (DANDI:001278):

| Modality | Asset | Zarr |
|---|---|---|
| XPCT | `sourcedata/raw/sub-Hb1/micr/sub-Hb1_sample-lefthemi_acq-zoom2_XPCT.ome.zarr` | `https://dandiarchive.s3.amazonaws.com/zarr/0a89ff02-90c4-4d3d-8275-8bc8ee140715/` |
| uCT | `derivatives/sub-Hb1/micr/sub-Hb1_sample-lefthemi+ICblock+punch1+piece1+trim9_acq-view1_desc-masked_uCT.ome.zarr` | `https://dandiarchive.s3.amazonaws.com/zarr/8a994baf-a833-48ac-bf16-83d997d0a292/` |

## Steps

Run in order, from a directory holding the inputs:

| Script | Input | Output |
|---|---|---|
| `extract_crop.py` | XPCT OME-Zarr level 0 (2.201 µm) | `sub-Hb1_sample-lefthemi_acq-zoom2_desc-crop_XPCT.nii.gz` |
| `reslice_XPCT_crop.sh` | crop + `sub-Hb1_sample-lefthemi_acq-zoom2_desc-prealign_xfm.lta` | `sub-Hb1_sample-lefthemi_acq-zoom2_desc-crop+prealigned_XPCT.nii.gz` |
| `register_XPCT_to_uCT.sh` | prealigned XPCT crop + prealigned uCT (level 2) and mask | `sub-Hb1_from-XPCT_to-uCT/` (affine + svf) |

- The crop spans voxels `(3140, 4441, 8558)` to `(3793, 5094, 9226)` (x, y, z) of level 0, i.e. 653 × 653 × 668 voxels.
- `nitorch reslice -il` only updates the header (no resampling).
- `sub-Hb1_sample-lefthemi+ICblock+punch1+piece1+trim9_acq-view1_desc-prealign_xfm.lta` is the prealignment of the uCT; its `desc-masked+level2+prealigned_uCT` image and `desc-level2+prealigned_mask` are made from level 2 with `nitorch reslice -il` in the same way.

## Environment

- [`nitorch`](https://github.com/balbasty/nitorch) (commit `477f281`)
- [`nifti-zarr`](https://github.com/neuroscales/nifti-zarr-py) 1.0.0rc8 (imported as `niizarr`), `nibabel`
