Coursera "Getting and Cleaning Data" Final Project
James Lucassen
===============================================================================
Original data from:

Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
===============================================================================
Experimental Details:

The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. The experiments have been video-recorded to
label the data manually. The obtained dataset has been randomly partitioned into
two sets, where 70% of the volunteers was selected for generating the training 
data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying 
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 
50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is 
assumed to have only low frequency components, therefore a filter with 0.3 Hz 
cutoff frequency was used. From each window, a vector of features was obtained 
by calculating variables from the time and frequency domain. 
See 'Features Info' for more details.
===============================================================================
Record details:

Each record in tidied_data.txt contains:
- 79 numeric fields containing time and frequency domain variables
- 1 string-factor field containing labeling the activity
- 1 integer field containing the identifier of the subject for the experiment

For each of the 79 numeric time/frequency sensor data fields, there is also an
entry in tidied_means.txt containing the mean for that column. There is also an
entry for subject, since the field is technically numeric, but it is meaningless
and can be safely ignored.
==============================================================================
This project includes the following files:

- README.txt
- codebook.txt  contains details on variables and summaries calculated, how data was processed, units, and other relevant information
- tidied_data.txt   contains data as described above in 'Record details'
- tidied_means.txt  contains data as described above in 'Record details'
===============================================================================
Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about the original dataset contact:
activityrecognition@smartlab.ws