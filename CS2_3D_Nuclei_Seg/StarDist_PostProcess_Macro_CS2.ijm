//*******************************************************************
// ImageJ Macro for Nuclei Segmentation with StarDist
// Date: November-2023
//*******************************************************************
// This macro runs the StarDist model and postprocessing in ImageJ 
// through an ImageJ macro for nuclei segmentation. It processes 
// images from a dataset comprising 2D slices of an embryo at a 
// single timepoint. The macro utilizes the deepImageJ plugin and 
// a fine-tuned StarDist model specific for Developing Tribolium
// Castaneum cell segmentation dataset from the Cell Tracking Challenge.
// Input:
//      Input images: A folder containing 2D slices of one timepoint 
//      of an embryo.
// Output:
//      Processed images: A folder containing segmentation results 
//      including masks for each image.
// Model: 
//      StarDist for Developing Tribolium Castaneum
// Requirements:
//      ImageJ (https://imagej.nih.gov/ij/)
//      deepImageJ plugin (https://deepimagej.github.io/deepimagej)
//      StarDist plugin (https://github.com/stardist/stardist)
// Credits: StarDist, DeepImageJ, Cell Tracking Challenge
// Please cite the respective contributions when using this code.
//*******************************************************************

// Define the path to the input images
inputPath = "your_input_path/";

// Define the path to the output masks and edges
outputPathMasks = "your_output_path/";

// Get all files from the directory
allFiles = getFileList(inputPath);

// Specify the target file number (e.g., 0174) (if the running process brakes in the middle of a timepoint)
// targetFileNumber = 413;

// Loop through each image
for (i = 0; i < lengthOf(allFiles); i++){
	print("Inside the loop");
    // Construct the full path for the current image
    currentFile = allFiles[i];
	// currentFileNumber = parseInt(substring(currentFile, indexOf(currentFile, "_downsampled") + 13, indexOf(currentFile, ".tif")));
    
    // Check if the current file number is less than or equal to the last file number
    // if (currentFileNumber <= targetFileNumber) {
    //     continue; // Skip processing for this file
    // }
    
    imagePath = inputPath + currentFile;

    // Open the image
    open(imagePath);
    
    // Process the image
    selectImage(currentFile);
    
    // Run StarDist with deepImageJ over the image
	run("DeepImageJ Run", "model=[StarDist Model for Drosophila Melanogaster Cell Segmentation] format=Tensorflow preprocessing=[per_sample_scale_range.ijm] postprocessing=[no postprocessing] axes=Y,X,C tile=1136,688,1 logging=Normal");
    
    // Extract the mask from the resulting stack
    selectWindow(getTitle());
    run("Make Substack...", "channels=1-1");
    
    // Obtain a clean mask
    selectWindow(getTitle());
    run("Enhance Contrast", "saturated=0.35");
    run("Maximum...", "radius=1");
    setMinAndMax(1.232E-3, 9.859E-3);setAutoThreshold("Default dark no-reset");
    call("ij.plugin.frame.ThresholdAdjuster.setMode", "Red");
    setOption("BlackBackground", true);
    run("Convert to Mask");
    
    selectWindow(getTitle());
    run("Watershed");
    run("Analyze Particles...", "size=100-Infinity circularity=0.30-1.00 show=Masks display clear summarize");
    
    // Save the processed image and results
    saveAs("Tiff", outputPathMasks + currentFile);
    
    // Close everything after saving
    run("Close All");
}