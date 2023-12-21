#*******************************************************************
# Python Script for Extracting 2D Slices from 3D Fluorescence Images
# Date: December-2023
#*******************************************************************
# This script processes 3D fluorescence microscopy image stacks, 
# extracting individual 2D slices based on specific timepoints and 
# focus planes. It is particularly useful for preparing data for 
# segmentation algorithms. The script reads through a designated 
# directory, identifies relevant 3D image stacks, and saves the 
# extracted 2D slices in a new directory.
# This code is specifically tailored for the Fluo-N3DL-TRIF dataset,
# from the Cell Tracking Challenge.
# Input:
#      Input images: A directory containing 3D fluorescence microscopy 
#      image stacks, segmented into timepoints and focus planes.
# Output:
#      Extracted 2D slices: A newly created directory containing 
#      individual 2D slices extracted from the 3D stacks.
# Requirements:
#      Python 3
#      tifffile library for reading and saving TIFF files
#      Developing Tribolium Castaneum Embryo dataset from the Cell
#      Tracking Challenge (Fluo-N3DL-TRIF)
# Please give credits to deepImageJ when using this code.
#*******************************************************************

import os
from tifffile import imread, imsave

path = "path_to_the_dataset/Fluo-N3DL-TRIF/FLUO-N3DL-TRIF-train/Fluo-N3DL-TRIF"
for f in os.listdir(path): # read the folders inside the path
    series = f.split("_")[0] # saves the series number, i.e., 01 or 02
    print(series)
    if f.__contains__("GT"): # Only processes the GT folder which contains SEG and TRA
        print(series)
        filenames = [m for m in os.listdir(os.path.join(path, f, "SEG"))] # gets all the files inside SEG only
        os.makedirs(os.path.join(path, series + "_source"), exist_ok=True) # Creates a directory with the same name as the series, i.e., 01 or 02, and "source" to save the input that this code generates
        print("created directory in " + os.path.join(path, series + "_source"))
        for m in filenames: # for each file among the masks in 01_GT / SEG
          name = m.split(".tif")[0] # retrieves the file name
          t = name.split('_')[2] # retrieves the timepoint
          z = int(name.split('_')[3]) # retrieves the focus plane (slice)
          volume = imread(os.path.join(path, series, f't{t}.tif')) # reads the volume in the input folder, i.e., 01 or 02
          im = volume[z] # keeps only the plane
          imsave(os.path.join(path, series + "_source", m), im) # Saves the plane as a new image in the source folder you have created