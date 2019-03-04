if [ $# -eq 0 ]; then
  echo "Usage: $0 <n_images>"
  exit 1
fi

N_IMAGES=$1

letter() {
  out=$(printf \\$(printf '%03o' $((RANDOM%26+65))))
  echo $out
}

for (( i = 0 ; i < $N_IMAGES ; i++ )); do
  NUMBERS=$(printf "%04d" $((RANDOM%10000)))
  LETTERS=$(letter)$(letter)$(letter)
  PLATE=$NUMBERS-$LETTERS
  echo "Generating $PLATE"
  convert -background white -fill black -pointsize 72 label:"$PLATE" img$i.png
done

