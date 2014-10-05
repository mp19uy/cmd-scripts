#!/bin/bash

# FUNCTION: 
#  Download videos from youtube using the command clive

# MANUAL: 
#  To specify the videos you want to download, add the youtube ID of the video
#  to the file 'list' (or create it if it doesn't exist yet)
#  The youtube video ID the parameter 'v=' that appears on the url of the video

# EXAMPLE: 
#  If the link is: https://www.youtube.com/watch?feature=player_embedded&v=9VqL6POWIoc
#  Then the video ID is 9VqL6POWIoc
#  You just need to add the video ID to a new line of the file 'list'

# PREREQUISITES: 
#  command clive installed ('sudo apt-get install clive' if not installed)
#  have a file called 'list' with the youtube videos ID's you want to download, one per line

# Get the result of wc -l list on $lineas variable 
lineas=$(wc -l list)

# removes ' list' from $lineas because wc -l FILENAME returns: 'NUMBER_OF_LINES FILENAME'
# so the command below removes the ' FILENAME' part 
# and the value of $lineas is now a number

lineas="${lineas//' list'/}"

for (( i = 1; i < $lineas; i++ )); do
	video="$(sed -n $i'p' list)"
	clive http://youtube.com/watch?v=$video
done
