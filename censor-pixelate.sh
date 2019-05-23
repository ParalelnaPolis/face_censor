  name=$(basename "$1")
  mkdir -p blurred
  out="blurred/$name"
  cp "$1" "$out"
  facedetect "$1" | while read x y w h; do
    if [[ "$x" =~ ^[0-9]+$ ]]
    then
        mogrify -gravity NorthWest -region "${w}x${h}+${x}+${y}" \
          -scale '10%' -scale '1000%' "$out"
    fi
  done
