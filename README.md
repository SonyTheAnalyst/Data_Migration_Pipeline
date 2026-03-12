# Data_Migration_Pipeline

Skip to content
SonyTheAnalyst
Data_Migration_Pipeline
Repository navigation
Code
Issues
Pull requests
Agents
Actions
Projects
Wiki
Security
Insights
Settings
Files
Go to file
t
README.md
Data_Migration_Pipeline
/
Pipeline_details.md
in
main

Edit

Preview
Indent mode

Spaces
Indent size

2
Line wrap mode

Soft wrap
Editing Pipeline_details.md file contents
  1
  2
  3
  4
  5
  6
  7
  8
  9
 10
 11
 12
 13
 14
 15
 16
 17
 18
 19
 20
 21
 22
 23
 24
 25
 26
 27
 28
 29
 30
 31
 32
 33
 34
 35
 36
 37
 38
 39
 40
 41
 42
 43
 44
 45
 46
 47
 48
 49
 50
 51
 52
 53
 54
 55
 56
 57
 58
 59
 60
 61
 62
 63
 64
 65
 66
 67
 68
 69

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





























Use Control + Shift + m to toggle the tab key moving focus. Alternatively, use esc then tab to move to the next interactive element on the page.
No file chosen
Attach files by dragging & dropping, selecting or pasting them.
