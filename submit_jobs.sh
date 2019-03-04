if [ $# -eq 0 ]; then
  echo "Usage: $0 <n_jobs> <n_images> <pointsize> [ <nodered_addr> ]"
  echo "  nodered_addr default = resin.local:1880"
  exit 1
fi

N_JOBS=$1
N_IMAGES=$2
SIZE=$3
ADDR=${4:-resin.local:1880}
URLBASE=https://raw.githubusercontent.com/rosogon/agile-review-demo/samples/images

for (( i = 0 ; i < $N_JOBS ; i++ )); do
  n=$((RANDOM%N_IMAGES))
  WAIT=$((RANDOM%6+2))
  URL=${URLBASE}/img_${SIZE}_${n}.png
  echo "Sending $URL"
  curl -X POST \
       -H"Content-type:application/json" \
       -d"{\"url\":\"$URL\"}" \
       $ADDR/api/newjob
  echo
  echo "Waiting $WAIT seconds"
  sleep $WAIT
done

