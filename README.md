# Measuring Length of Sperm Cell of Fruit Flies 
CSE 554 Final Project<br />
Course: Geometric Computing for Biomedicine <br />
Author: Finley Li  <br />
Instructor: Prof. Tao Ju <br />
Institution: Washington University in St. Louis <br />

# Introduction 
The longest sperm ever recorded comes from the fruit fly Drosophila bifurca, which is a total of 5.8 centimeters long, about 20 times longer than the fly itself. For years, scientists and researchers have been interested in measuring the length of the sperm cells from these fruit flies, as it serves as the key to further understand their genetic makeup and opens the door to more interesting and impactful research on the fruit flies. The common practice for sperm cell measurement is through manual measurement, usually with the help of tools such as ImageJ’s “Measure” feature, which could often be a laborious process. In this project, I designed an interactive tool using Matlab that can not only help to ease the task for researchers but obtain an accurate measurement result as well.

# Requirements
1. Make sure Matlab is properly installed on your system. Refer to the following link for more information on the installation: https://www.mathworks.com/help/install/install-products.html <br />
2. You would also need to install Python, Anaconda and the OpenCV package on your system. For more information, visit: https://realpython.com/installing-python/ <br /> https://docs.anaconda.com/anaconda/install/ <br /> https://medium.com/@pranav.keyboard/installing-opencv-for-python-on-windows-using-anaconda-or-winpython-f24dd5c895eb 



# How to use
1. Open the Anaconda terminal and navigate to the directory where the source files are using the "cd" command. <br />

2. Run "matlab -r imagegui" from the command line to open the GUI. <br />

3. When the GUI starts up, upload the image from your local system using the "Upload" button. The original image would be displayed on the left axes, and the down-scaled image that you would perform operation on would be displayed on the right axes. <br />

4. If the target sperm cell is not visible, click on "Brighten image" in the "Image processing toolbox" to adjust the brightness of the image. If the image is bright and noisy, use "Subtract background " to denoise along with "Brighten image" to increase the visibility of the sperm cell.  <br />

5. After the image is cleaned up reasonably, click on "Confirm Changes" to save all the changes you made, and move on to image thresholding. (Note: you must confirm the changes before moving on to thresholding!)  <br />

6. Drag the thresholding slider to further clean up the image while preserving the main body of the target cell. During thresholding, if the cells fade out or become segmented, you can utilize the "Pen Tool" to trace along or reconnect them. To do so, simply click on "Pen Tool" and follow the instructions on the screen. Occasionally, you would like to filter out part of the image that is irrelevant and distracting (unfiltered debris, non-target cells etc.), this could be done using the "Eraser" button. Simply place the draggable rectangle on the unwanted part of the image to blacken it out.  <br />

7. Once the image is thresholded and the cell body is properly preserved, click on "Detect Cell" to detect the cell and see it overlaid on top of the original image in red. If only part of the target cell is detected due to segmentation, you can change the K parameter to include more parts until the entire cell is recognized. If the program misidentifies the cell (this could happen if you over/under-thresholded the image), you have the option to go back and rethreshold the image by simply dragging the thresholding slider as detailed in step 6. 

8. If the correct cell is detected, click on "Report Length" to obtain its length in micrometers. 

9. At any time, you can always restart the process by clicking the "Reset" button.  



