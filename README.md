# deepImageJ Repository for Bridging the Gap: Integrating cutting-edge techniques into Biological Imaging with deepImageJ

This repository contains the necessary codes and scripts to replicate the case studies presented in the article "Bridging the Gap: Integrating cutting-edge techniques into Biological Imaging with deepImageJ". It showcases the use of [deepImageJ](https://github.com/deepimagej) in various image processing scenarios, specifically focusing on image-to-image translation, nuclei segmentation, and integration with the BioImage Model Zoo.

## Case Studies

### Case Study 1: deepImageJ Pipeline for Integrated Image-to-Image Translation and Nuclei Segmentation
- **Description**: This case study demonstrates the use of deepImageJ for performing image-to-image translation from actin to DAPI images, followed by nuclei segmentation using the StarDist model. The pipeline is then integrated into a macro for batch processing.
- **Files**:
  - `prepare_dataset.py`: Script for preparing the dataset for image-to-image translation and segmentation.
  - `StarDist Postprocess macro CS1.ijm`: ImageJ Macro for StarDist post-processing in Case Study 1.
- **Notebooks**: [Pix2Pix](https://colab.research.google.com/github/HenriquesLab/ZeroCostDL4Mic/blob/master/Colab_notebooks/pix2pix_ZeroCostDL4Mic.ipynb) and [StarDist 2D](https://colab.research.google.com/github/HenriquesLab/ZeroCostDL4Mic/blob/master/Colab_notebooks/StarDist_2D_ZeroCostDL4Mic.ipynb) from ZeroCostDL4Mic.
- **Dataset**: [Pix2Pix, Lifeact-RFP actin stain images](https://doi.org/10.5281/zenodo.3941889) and [StarDist, sir-DNA dapi stain images](https://doi.org/10.5281/zenodo.3715492)
- **Models**: [Pix2Pix for Image Translation from Lifeact-RFP to sir-DNA](https://zenodo.org/records/10405149) and [StarDist Model for Nuclei Segmentation in Synthetic Lifeact-RFP](https://zenodo.org/records/10406307)

### Case Study 2: Comprehensive 3D Nuclei Segmentation with deepImageJ
- **Description**: In this case study, deepImageJ is utilized for detailed 3D nuclei segmentation, showcasing its capability in handling complex volumetric data. The pipeline involves the generation of ground truth data, followed by the use of StarDist for nuclei segmentation. The pipeline is then integrated into a macro for batch processing.
- **Files**:
  - `Generated_GT.py`: Script for generating ground truth data for 3D nuclei segmentation.
  - `Mount_stardist_dataset.py`: Script for setting up the StarDist dataset for 3D segmentation.
  - `StarDist_postprocess_macro_cs2.ijm`: ImageJ Macro for StarDist post-processing in Case Study 2.
- **Notebooks**: [StarDist 2D](https://colab.research.google.com/github/HenriquesLab/ZeroCostDL4Mic/blob/master/Colab_notebooks/StarDist_2D_ZeroCostDL4Mic.ipynb)
- **Dataset**: Developing Tribolium Castaneum Embryo from [Cell Tracking Challenge](http://celltrackingchallenge.net/3d-datasets/)
- **Model**: [StarDist Model for Developing Tribolium Castaneum Embryo](https://zenodo.org/records/10406344)

### Case Study 3: Segmentation of Arabidopsis Apical Stem Cells and Integration with the BioImage Model Zoo in deepImageJ
- **Description**: This case study involves the segmentation of Arabidopsis apical stem cells and demonstrates the integration with the BioImage Model Zoo using deepImageJ.
- **Dataset**: [Research data supporting Cell size and growth regulation in the Arabidopsis thaliana apical stem cell niche](https://www.repository.cam.ac.uk/items/f7cdcf20-e8ca-4cf5-b7ab-90350a8d00b2)
- **Models**: [3D Unet Arabidopsis Apical Stem Cells](https://zenodo.org/records/7768142) with `emotional-cricket` ID for the [BioImage Model Zoo](bioimage.io)

## Installation and Usage

Please ensure you have deepImageJ and the required plugins installed in your ImageJ/Fiji environment. For more detailed instructions, please refer to the individual scripts and macros within each case study folder.

## Contributing

Contributions to this repository are welcome. Please open an issue or submit a pull request with your suggestions or enhancements.

## Citation

If you use the code or data from this repository in your research, please cite the following articles:

Gómez-de-Mariscal, E., García-López-de-Haro, C., Ouyang, W., Donati, L., Lundberg, E., Unser, M., ... & Sage, D. (2021). DeepImageJ: A user-friendly environment to run deep learning models in ImageJ. Nature Methods, 18(10), 1192-1195.

Maška, M., Ulman, V., Delgado-Rodriguez, P., Gómez-de-Mariscal, E., Nečasová, T., Guerrero Peña, F. A., ... & Ortiz-de-Solórzano, C. (2023). The Cell Tracking Challenge: 10 years of objective benchmarking. Nature Methods, 1-11.

Ouyang, W., Beuttenmueller, F., Gómez-de-Mariscal, E., Pape, C., Burke, T., Garcia-López-de-Haro, C., ... & Kreshuk, A. (2022). Bioimage model zoo: a community-driven resource for accessible deep learning in bioimage analysis. bioRxiv, 2022-06.

de Haro, C. G. L., Dallongeville, S., Musset, T., de Mariscal, E. G., Sage, D., Ouyang, W., ... & Olivo-Marin, J. C. (2023). JDLL: A library to run Deep Learning models on Java bioimage informatics platforms. arXiv preprint arXiv:2306.04796.

von Chamier, L., Laine, R. F., Jukkala, J., Spahn, C., Krentzel, D., Nehme, E., ... & Henriques, R. (2021). Democratising deep learning for microscopy with ZeroCostDL4Mic. Nature communications, 12(1), 2276.

Maška, M., Ulman, V., Delgado-Rodriguez, P., Gómez-de-Mariscal, E., Nečasová, T., Guerrero Peña, F. A., ... & Ortiz-de-Solórzano, C. (2023). The Cell Tracking Challenge: 10 years of objective benchmarking. Nature Methods, 1-11.

## License

MIT License
Copyright (c) 2023 Deep ImageJ

## Acknowledgments
We  acknowledge the contributors of deepImageJ, StarDist, ZeroCostDL4Mic, the Cell Tracking Challenge, the BioImage Model Zoo and other tools that made this research possible.
