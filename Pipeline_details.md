
<img width="1368" height="414" alt="image" src="https://github.com/user-attachments/assets/615553be-3871-43fc-ae0e-a6d09369abab" />

## Overview
Get Metadata1 is the first activity in the pipeline that retrieves metadata information about files and folders from the source directory. Instead of processing actual file data, it extracts metadata such as file names, types, sizes, and last modification dates.

## Purpose
This activity scans the specified source location and returns a list of child items (files/folders) that will be used by downstream activities, particularly the ForEach loop for dynamic file processing.
<img width="1119" height="271" alt="image" src="https://github.com/user-attachments/assets/c0c60a85-55ff-4c20-94ff-34b6c7725b4f" />

# the lookup activity
Retrieves a list of all FileNames from the FileTracker table in the warehouse. This is used to validate or cross-reference files being processed.


<img width="698" height="293" alt="image" src="https://github.com/user-attachments/assets/a5dfaef3-a85e-43dd-8f4c-1f8d72f1e0c4" />

# Filter1 Activity
Filter1 is a filter activity that processes the metadata list from Get Metadata1 and applies conditional logic to select only files that should be processed. 
It uses two expressions: one to get the input items and another to define the filtering condition.


<img width="551" height="165" alt="image" src="https://github.com/user-attachments/assets/d88ce4be-760c-49ae-8251-f20b01b11df8" />

@activity('Get Metadata1').output.childItems

@not(contains(string(activity('Lookup1').output.value), item().name))


For each file from Get Metadata1:

  IF (file name is NOT in the Lookup1 FileTracker list):
    THEN include this file in output
  ELSE
    THEN exclude this file (already processed)

    

# For each activity

<img width="634" height="179" alt="image" src="https://github.com/user-attachments/assets/4b39fe09-9002-47e2-805e-ad5b87bd8317" />




























