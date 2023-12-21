#*******************************************************************
# Python Script for Selective File Copying Based on Filename Criteria
# Date: December-2023
#*******************************************************************
# This script is designed to selectively copy files from an input 
# directory to an output directory based on specific filename criteria. 
# It specifically looks for files containing "fake_B" in their names, 
# which indicates a certain category or type of file in the dataset. 
# This is useful in scenarios where only a subset of files needs to 
# be processed or transferred.
# Input:
#      Input directory: Contains a mix of files.
# Output:
#      Output directory: Receives only the files from the input 
#      directory that meet the specified criteria.
# Requirements:
#      Python 3
#      os, shutil libraries
#*******************************************************************

import os
import shutil
input_dir = "your_input_directory"
output_dir = "your_output_directory"

# Copy the files from input_dir to output_dir, only the ones with "FakeB" in the name
c = 0
for file in os.listdir(input_dir):
    if file.__contains__("fake_B"):
        source_path = os.path.join(input_dir, file)
        destination_path = os.path.join(output_dir, file)
        shutil.copy(source_path, destination_path)
        c += 1

print(f"Copied {c} files from {input_dir} to {output_dir}.")