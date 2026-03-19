# LINC diffusion MRI – X-ray pipeline 🧠🔗🩻
## Scripts

This work has required the use of a few Python tools:

| Repository                                                                                                 | Usecase                                                                                                                              |
|------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| [`stack-to-chunk`](https://github.com/HiPCTProject/stack-to-chunk)                                         | Conversion of a series of 2D images to a 3D volume stored as an OME-Zarr                                                             |
| [`ngregister`](https://github.com/HiPCTProject/ngregister)                                                 | Register with an affine transform using a set of hotkeys within Neuroglancer (optimal for large multiscale dataset)                  |
| [`segment_properties_for_neuroglancer`](https://github.com/chourroutm/segment_properties_for_neuroglancer) | Generate the segmentation properties for the Neuroglancer precomputed format to add metrics and a colormap to the segmentation layer |
| [`freesurfer`](https://github.com/freesurfer/freesurfer)                                                   | Suite of processing tools for 3D imaging data, initially focused on MRI and the NIfTI file format                                    |
| [`nitorch`](https://github.com/balbasty/nitorch)                                                           | (Yet another) suite of processing tools for 3D imaging data, initially focused on MRI and the NIfTI file format                      |
| [`ngtools`](https://github.com/neuroscales/ngtools)                                                        | Web browser-based data viewer with an extensive set of utilities                                                                     |
