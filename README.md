# LINC diffusion MRI – X-ray pipeline 🧠🔗🩻

Supplementary material for the LINC diffusion MRI – X-ray paper.

## Preprint
This work is currently available on bioRXiv as a preprint: 

| https://www.biorxiv.org/content/10.64898/2026.04.02.716198 |
|:-----:|
| <img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=https://www.biorxiv.org/content/10.64898/2026.04.02.716198" /> |



## Gallery
The data can be opened in the web browser from the LINC Gallery: 

| https://gallery.lincbrain.org/mri-xray |
|:-----:|
| <img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=https://gallery.lincbrain.org/mri-xray" /> |



## Scripts

This work has required the use of a few Python tools:

| Repository                                                                                                 | Usecase                                                                                                                              |
|------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| [`stack-to-chunk`](https://github.com/HiPCTProject/stack-to-chunk)                                         | Conversion of a series of 2D images to a 3D volume stored as an OME-Zarr                                                             |
| [`ngregister`](https://github.com/HiPCTProject/ngregister)                                                 | Register with an affine transform using a set of hotkeys within Neuroglancer (optimal for large multiscale datasets)                  |
| [`segment_properties_for_neuroglancer`](https://github.com/chourroutm/segment_properties_for_neuroglancer) | Generate the segmentation properties for the Neuroglancer precomputed format to add metrics and a colormap to the segmentation layer |
| [`freesurfer`](https://github.com/freesurfer/freesurfer)                                                   | Suite of processing tools for 3D imaging data, initially focused on MRI and the NIfTI file format                                    |
| [`nitorch`](https://github.com/balbasty/nitorch)                                                           | (Yet another) suite of processing tools for 3D imaging data, initially focused on MRI and the NIfTI file format                      |
| [`ngtools`](https://github.com/neuroscales/ngtools)                                                        | Web browser-based data viewer with an extensive set of utilities                                                                     |
| [`tirl`](https://git.fmrib.ox.ac.uk/ihuszar/tirl/)   | Registration library; cf. [doi:10.1016/j.neuroimage.2022.119792](https://www.sciencedirect.com/science/article/pii/S1053811922009132). |
