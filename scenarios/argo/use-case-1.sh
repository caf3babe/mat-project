#!/usr/bin/env bash

set -E

echo Starting load on Car-Rental - will run for 10 minutes
date '+%Y-%m-%d %H:%M:%S'

trap 'killall hey' ERR

hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/' &
hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/runtime.8f4b81746d1eff2a.js' &
hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/polyfills.52efa3afb022db2a.js' &
hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/main.8cc27cdf81a7ee9d.js' &
hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/styles.69fb83f21957d6ac.css' &
hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/fleet.jpeg' &
hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/favicon.ico' &
hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/banner.a43723b07eefb65d.jpg' &
hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/car?currencySymbol=USD' &
hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/currency' &
hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/seats.png' &
hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/gear.png' &
hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/km.png' &
hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/suitcase_big.png' &
hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/location' &
hey -c 100 -z 10m -q 1 -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/auth/order' &
hey -c 100 -z 10m -q 1 -o csv -m POST -T "application/json" -d '{"car_id":"1","location_of_rental_id":2,"location_of_return_id":2,"date_of_booking":"2023-04-13","date_of_rental":"2023-04-13","date_of_return":"2023-04-20","method_of_payment":"AMERICAN_EXPRESS","card_number":"2323423423423423","card_security_code":"332","valid_until":"2027-04-01","first_name":"Nichil","last_name":"Strasser","email":"nichil.strasser@gmail.com","order_status":"CREATED"}' 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/order' &

echo Waiting 15s for metrics to be available
sleep 15

export KUBECONFIG=/Users/nichil/Studies/mat-infra/azure/mat-project-2110838008-argo-kube.conf
echo Starting upgrade of frontend
date '+%Y-%m-%d %H:%M:%S'

CHART_HOME=../../../mat-deploy/argo/app
helm upgrade -i frontend "$CHART_HOME/10-frontend" -n car-rental --atomic

echo Helm upgrade operation completed 
date '+%Y-%m-%d %H:%M:%S'
