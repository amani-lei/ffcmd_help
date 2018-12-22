ffcmd_help
======
Automatically complete ffmpeg parameters for you
一个自动补齐/提示工具,可以自动提示/补齐FFMpeg的参数或选项

First:首次
-----
*  1, $git clone https://github.com/amani-lei/ffcmd_help.git
*  2, $cd ffcmd_help
*  3, $chmod +x ./ffcmd_init.bash && ./ffcmd_init.bash
*  4, $source ./ffcmd.source

Future:以后
-----
*  4, $source ./ffcmd.source

Usage:用法
-----
### Quickly input:快速输入
*  $ffmpeg fc[tab][tab]  #
    "ffmpeg -filter_complex "
    
  *    bf | -bf  = "-bsfs"
  *    fc | -fc  = "-filter_complex"
  *    fi | -fi  = "-filter"
    

### Auto-complete:自动补齐/提示

> Notice if there is any space before [TAB],注意[tab]前面是否有空格

*  $ffmpeg -[tab][tab]
>"-i -h -c -formats -codecs ....."<br>
#show general operation,no space in front of the TAB,提示/补齐所有操作
  
*  $ffmpeg -cod[tab][tab]
>"ffmpeg -codecs "<br>
#show filters that begins with "-",no space in front of the TAB,提示/补齐"-cod"开头的操作
   
*  $ffmpeg -c [tab][tab]
>"libx264 aac hevc ......." <br>
#show all codecs,提示所有编解码器,tab前面有空格

*  $ffmpeg -c lib[tab][tab]
>"libx264 libx265 libxxxxx...." <br>
#show codecs that begins with "lib",no space in front of the TAB,提示/补齐lib开头的编解码器
       
*  $ffmpeg -f [tab][tab]
>"mpeg4 jpeg pcm16be ..." <br>
#show all formats(muxers/demuxers),提示所有格式(复用/解复用器)
    
*  $ffmpeg -c:v hev[tab][tab]
>"ffmpeg -c:v hevc " <br>
#show video codecs that begins with "hev",no space in front of the TAB,提示/补齐hev开头的视频编解码器

*  $ffmpeg -filter [tab][tab]
>"overlay scale ...." <br>
#show all filters,提示所有滤镜
   
*  $ffmpeg -filter ov[tab][tab]
>"$ffmpeg -filter overlay "<br>
#show filters that begins with "ov",no space in front of the TAB,提示/补齐ov开头的滤镜
