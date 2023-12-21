#*******************************************************************
# Python Script for Splitting Image Data into Train and Test Sets
# Date: December-2023
#*******************************************************************
# This script is designed to randomly select and copy pairs of images 
# and their corresponding masks from a source directory into separate 
# training and testing directories. It's particularly useful for 
# preparing data for machine learning tasks in image segmentation. 
# The script allows for specifying the number of samples to be included 
# in each set.
# This script was designed for the following dataset:
#      Developing Tribolium Castaneum Embryo from the Cell Tracking 
#      Challenge
# It is expected to be applied after the "Genearate_GT.py" script.
# Input:
#      Source directory: Contains subdirectories with images and their 
#      corresponding segmentation masks.
# Output:
#      Train and Test directories: Each containing a specified number 
#      of randomly selected image-mask pairs.
# Requirements:
#      Python 3
#      os, random, shutil libraries
# Please cite deepImageJ and the Cell Tracking Challenge when using
# this script.
#*******************************************************************


import os
import random
import shutil

# Define the source and destination folders
source_folder = "path_to_your_source_folder"
train_folder = "path_to_your_output_folder/train"
test_folder = "path_to_your_output_folder/test"

num_samples = 40

# Create train and test folders if they don't exist
os.makedirs(train_folder, exist_ok=True)
os.makedirs(test_folder, exist_ok=True)

# Function to copy a random set of paired images from source to destination
def copy_random_image_mask_pairs(source_image_folder, source_mask_folder, destination_input_folder, destination_mask_folder, num_pairs):
    # List all images in the source directory
    all_images = os.listdir(source_image_folder)
    
    # Shuffle the list to randomly select pairs
    random.shuffle(all_images)
    
    # Select the first 'num_pairs' images
    selected_images = all_images[:num_pairs]
    
    for image in selected_images:
        src_image_path = os.path.normpath(os.path.join(source_image_folder, image))
        dst_image_path = os.path.normpath(os.path.join(destination_input_folder, image))
        # For each source image, find the corresponding mask image and copy it
        src_mask_path = os.path.normpath(os.path.join(source_mask_folder, image))
        dst_mask_path = os.path.normpath(os.path.join(destination_mask_folder, image))
        
        shutil.copy(src_image_path, dst_image_path)
        shutil.copy(src_mask_path, dst_mask_path)

# Copy random image-mask pairs from "01_source" and "01_GT/SEG" to "train"
copy_random_image_mask_pairs(os.path.join(source_folder, "01_source"), os.path.join(source_folder, "01_GT/SEG"), os.path.join(train_folder, "input"), os.path.join(train_folder, "mask"), num_samples)

# Copy random image-mask pairs from "02_source" and "02_GT/SEG" to "test"
copy_random_image_mask_pairs(os.path.join(source_folder, "02_source"), os.path.join(source_folder, "02_GT/SEG"), os.path.join(test_folder, "input"), os.path.join(test_folder, "mask"), num_samples)

print("Paired images copied successfully.")