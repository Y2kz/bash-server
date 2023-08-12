#!/bin/sh
#read -p "Port To start webserver:" PORT
PORT=4000


#Removed the start up and figlet not available in every distro by default so disabling
#function init() {
#init() {
#  echo "-----------------------------------------------------"
#  echo -n "[INFO] Start at: "
#  date "+%Y/%m/%d-%H:%M:%S"
#  echo "-----------------------------------------------------"
#  figlet "bash server"
#  echo "-----------------------------------------------------"
#  echo "The Server is running at http://127.0.0.1:${PORT}"
#  echo "-----------------------------------------------------"
#}

#function response() {
response() {
  echo "HTTP/1.0 200 OK"
  echo "Content-Type: text/plain"
  echo ""
  echo "Hello, World"
}


##################################################
# mainFunction
##################################################
#init

#Disabled Logging
# Logging
#LOG_OUT="stdout.log"
#LOG_ERR="stderr.log"

#exec 1>> (tee -a $LOG_OUT)
#exec 2>> (tee -a $LOG_ERR)

# If there is a named pipe, delete it first
if [ -e "./stream" ]; then
  rm stream
fi

trap exit INT
mkfifo stream
while true; do
  nc -l "$PORT" -w 1 < stream | awk '/HTTP/ {system("./get_content.sh " $2)}' > stream
done
