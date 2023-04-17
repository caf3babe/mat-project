#!/usr/bin/env bash

echo "Started at $(date '+%Y-%m-%d %H:%M:%S')"

trap 'killall hey' EXIT

# hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/' > /dev/null &
# hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/runtime.8f4b81746d1eff2a.js' > /dev/null &
# hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/polyfills.52efa3afb022db2a.js' > /dev/null &
# hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/main.8cc27cdf81a7ee9d.js' > /dev/null &
# hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/styles.69fb83f21957d6ac.css' > /dev/null &
# hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/fleet.jpeg' > /dev/null &
# hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/seats.png' > /dev/null &
# hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/gear.png' > /dev/null &
# hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/km.png' > /dev/null &
# hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/suitcase_big.png' > /dev/null &
# hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/favicon.ico' > /dev/null &
# hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/banner.a43723b07eefb65d.jpg' > /dev/null &
# hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/car?currencySymbol=USD' > /dev/null &
# hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/currency' > /dev/null &
# hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/location' > /dev/null &
hey -c 1 -z 10m -o csv -m POST -T "application/json" -d '{"car_id":"1","location_of_rental_id":2,"location_of_return_id":2,"date_of_booking":"2023-04-13","date_of_rental":"2023-04-13","date_of_return":"2023-04-20","method_of_payment":"AMERICAN_EXPRESS","card_number":"2323423423423423","card_security_code":"332","valid_until":"2027-04-01","first_name":"Nichil","last_name":"Strasser","email":"nichil.strasser@gmail.com","order_status":"CREATED"}' 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/order' > /dev/null &

sleep 15
echo "Triggering pipeline"
responseJson=$(curl http://localhost:9000/gate/webhooks/webhook/api-gateway -X POST -H "content-type: application/json" -d '{"action": "start"}' 2>/dev/null)

eventId=$(echo "$responseJson" | jq -r ".eventId")

echo "EventId is: $eventId"

status="NO_STATUS"
while [[ ! "$status" =~ (SUSPENDED|SUCCEEDED|TERMINAL|CANCELED|STOPPED) ]]
do
  pipelineStatusJson=$(curl "http://localhost:9000/gate/applications/car-rental/pipelines" 2>/dev/null)
  status=$(echo "$pipelineStatusJson" | jq -r ".[] | select(.trigger.eventId == \"$eventId\") | .status")
  sleep 10
done

echo "Status changed to $status"
echo "Ended at $(date '+%Y-%m-%d %H:%M:%S')"

# ./use-case-2.sh
# Started at 2023-04-17 18:49:11
# Triggering pipeline
# EventId is: 35b70461-be23-46a9-833a-aef93b4c77dc
# Status changed to SUCCEEDED
# Ended at 2023-04-17 18:55:45
# ./use-case-2.sh: line 43: 28225 Terminated: 15          hey -c 1 -z 10m -o csv -m POST -T "application/json" -d '{"car_id":"1","location_of_rental_id":2,"location_of_return_id":2,"date_of_booking":"2023-04-13","date_of_rental":"2023-04-13","date_of_return":"2023-04-20","method_of_payment":"AMERICAN_EXPRESS","card_number":"2323423423423423","card_security_code":"332","valid_until":"2027-04-01","first_name":"Nichil","last_name":"Strasser","email":"nichil.strasser@gmail.com","order_status":"CREATED"}' 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/order' > /dev/null