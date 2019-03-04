if [ $# -eq 0 ]; then
  echo "Usage: $0 <n_jobs> <n_images> [ <nodered_addr> ]"
  echo "  nodered_addr default = resin.local:1880"
  exit 1
fi

N_JOBS=$1
N_IMAGES=$2
ADDR=${3:-resin.local:1880}
IMG_URL=http://jurnsearch.files.wordpress.com/2009/07/ocr-test.jpg

for (( i = 0 ; i < $N_JOBS ; i++ )); do
#  curl -X POST \
#       -H"Content-type:application/json" \
#       -d"{\"url\":\"$IMG_URL\",\"batchId\":\"$BATCH_ID\"}" \
#       $ADDR/newjob
  IMG=$((RANDOM%N_IMAGES))
  WAIT=$((RANDOM%10+2))
  echo "Sending IMG$IMG"
  echo "Waiting $WAIT seconds"
  #sleep $WAIT
done

