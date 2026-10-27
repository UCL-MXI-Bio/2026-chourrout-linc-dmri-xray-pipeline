from niizarr import zarr2nii
import nibabel as nib
nivol = zarr2nii("https://dandiarchive.s3.amazonaws.com/zarr/0a89ff02-90c4-4d3d-8275-8bc8ee140715/", level=0)

# Recovered from the header of hemi_voi_crop_level0.prealigned(inv).moved.nii.gz:
# moved_affine = affine.lta^(-1/2) @ I74_..._bm18.lta @ crop_affine  (exact to 3e-10)
coords = [(3140, 4441, 8558), (3793, 5094, 9226)]

sform = nivol.get_sform()

nivol.set_sform(sform, code=1)

nivol_crop = nivol.slicer[coords[0][0]:coords[1][0], coords[0][1]:coords[1][1], coords[0][2]:coords[1][2]]

nivol_crop.to_filename("hemi_voi_crop_level0.nii.gz")
