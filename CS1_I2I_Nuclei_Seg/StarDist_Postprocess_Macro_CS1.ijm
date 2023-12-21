//*******************************************************************
// ImageJ Macro for Automated Image Processing with StarDist
// Date: December-2023
//*******************************************************************
// Macro that runs Pix2Pix and StarDist on a set of actin (membrane 
// stain) images to ultimately obtain synthetic DAPI images (nuclei stain). 
// The pipeline first applies Pix2Pix for image-to-image translation,
// followed by nuclei segmentation with StarDist. It then obtains masks 
// through StarDist postprocessing.
// Input:
//      Input images: A folder containing actin images to be converted
//      into synthetic (fake) DAPI ones.
// Output:
//      Synthetic-DAPI: A folder containing all synthetic DAPI images
//      generated from the actin images.
//      Masks-DAPI: A folder containing all the masks obtained after 
//      processing the synthetic DAPI images with StarDist and its
//      postprocessing.
// Models:
//      Pix2Pix for Generating Synthetic DAPI images
//      StarDist to perform nuclei segmentation over DAPI images
// Requirements:
//      ImageJ (https://imagej.nih.gov/ij/)
//      deepImageJ plugin (https://deepimagej.github.io/deepimagej)
//      StarDist plugin (https://github.com/stardist/stardist)
// Credits: StarDist, DeepImageJ
// Please cite the respective contributions when using this code.
//*******************************************************************



// Define the path to input images
// It expects a folder with all the images that are willing to be processed
inputPath = "input_path";

// Define the path to output images
outputSyntheticDapi = "output_path/Synthetic-Dapi/";
outputPathMasks = "output_path/Masks-Dapi/";

// Get all files from the directory
allFiles = getFileList(inputPath);

// If pipeline gets broken in the middle: Specify the target file number (e.g., 0174)
// targetFileNumber = 413;

// Loop through each image
for (i = 0; i < lengthOf(allFiles); i++){
    // Construct the full path for the current image
    currentFile = allFiles[i];
	//currentFileNumber = parseInt(substring(currentFile, indexOf(currentFile, "_downsampled") + 13, indexOf(currentFile, ".tif")));
    
    // If pipeline gets broken in the middle: Check if the current file number is less than or equal to the last file number 
    // if (currentFileNumber <= targetFileNumber) {
    //     continue; // Skip processing for this file
    // }
    
    imagePath = inputPath + currentFile;

    // Open the image
    open(imagePath);
    
    // Process the image
    selectImage(currentFile);
    
    // ================ PIX2PIX ===============================
    run("DeepImageJ Run", "model=Pix2Pix_lifeact-RFP_sir-DNA format=Pytorch preprocessing=[[per_sample_scale_range.ijm, scale_linear.ijm]] postprocessing=[no postprocessing] axes=C,Y,X tile=1,1024,1024 logging=Normal");
    selectWindow(getTitle());
    run("Enhance Contrast", "saturated=0.35");
    selectWindow(getTitle());
    saveAs("Tiff", outputSyntheticDapi + currentFile);
    
    // ================ STARDIST ==============================
    // Run StarDist with deepImageJ over the image
	run("DeepImageJ Run", "model=stardist_topix2pix format=Tensorflow preprocessing=[per_sample_scale_range.ijm] postprocessing=[no postprocessing] axes=Y,X,C tile=1216,1216,1 logging=Normal");
    
    // Extract the mask from the resulting stack
    selectWindow(getTitle());
    run("Make Substack...", "channels=1-1");
    
    // ================ POSTPROCESS ===========================
    // Obtain a clean mask
    selectWindow(getTitle());
    run("Enhance Contrast", "saturated=0.35");
    run("Maximum...", "radius=1");
    setAutoThreshold("Default dark no-reset");
    setOption("BlackBackground", true);
	run("Convert to Mask");
    selectWindow(getTitle());
    saveAs("Tiff", outputPathMasks + currentFile);
    run("Close All");
}