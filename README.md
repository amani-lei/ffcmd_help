# ffcmd_help
Automatically complete ffmpeg parameters for you

First:
  1, git clone https://github.com/amani-lei/ffcmd_help.git
  2, cd ffcmd_help
  3, chmod +x ./ffcmd_init.bash && ./ffcmd_init.bash
  4, source ./ffcmd.source

Future:
  source ./ffcmd.source

Usage:

  ffmpeg -[tab][tab]  #show general operation
    "-i -h -c -formats -codecs ....."

  ffmpeg -c [tab][tab] #show all codecs
    "libx264 aac hevc ......."
  
  ffmpeg -c lib[tab][tab] #show codecs that begins with "lib"
    "libx264 libx265 libxxxxx...."
    
  ffmpeg -c:v lib[tab][tab] #show video codecs that begins with "lib"
    "libx264 libx265...."
    
  ffmpeg -filter [tab][tab] #show all filters
    "overlay scale ...."
    
  ffmpeg -filter o[tab][tab] #show filters that begins with "o"
    "oscilloscope overlay owdenoise ..."
