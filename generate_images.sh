if [ $# -eq 0 ]; then
  echo "Usage: $0 <n_images> <pointsize>"
  exit 1
fi

N_IMAGES=$1
SIZE=$2

letter() {
  out=$(printf \\$(printf '%03o' $((RANDOM%26+65))))
  echo $out
}

for (( i = 0 ; i < $N_IMAGES ; i++ )); do
  NUMBERS=$(printf "%04d" $((RANDOM%10000)))
  LETTERS=$(letter)$(letter)$(letter)
  PLATE=$NUMBERS-$LETTERS
  echo "Generating $PLATE"
  convert -background white -fill black -pointsize $SIZE label:"$PLATE" img_${SIZE}_${i}.png
done

