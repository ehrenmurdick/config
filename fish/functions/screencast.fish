function screencast
  ffmpeg -f x11grab -video_size 1920x1080 -framerate 25 -i $DISPLAY -c:v ffvhuff /tmp/screen.mkv
end

