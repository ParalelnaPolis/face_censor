  name=$(basename "$1")
  mkdir -p blurred
  out="blurred/$name"
  cp "$1" "$out"
  facedetect "$1" | while read x y w h; do
    mogrify -gravity NorthWest -region "${w}x${h}+${x}+${y}" \
      -blur "0x80" "$out"
  done