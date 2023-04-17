#!/usr/bin/env bash

set -E

echo "Started at $(date '+%Y-%m-%d %H:%M:%S')"

trap 'killall hey' ERR EXIT

hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/' > /dev/null &
hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/runtime.8f4b81746d1eff2a.js' > /dev/null &
hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/polyfills.52efa3afb022db2a.js' > /dev/null &
hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/main.8cc27cdf81a7ee9d.js' > /dev/null &
hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/styles.69fb83f21957d6ac.css' > /dev/null &
hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/fleet.jpeg' > /dev/null &
hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/seats.png' > /dev/null &
hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/gear.png' > /dev/null &
hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/km.png' > /dev/null &
hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/suitcase_big.png' > /dev/null &
hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/favicon.ico' > /dev/null &
hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/banner.a43723b07eefb65d.jpg' > /dev/null &
hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/car?currencySymbol=USD' > /dev/null &
hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/currency' > /dev/null &
hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/location' > /dev/null &
hey -c 10 -z 10m -o csv -m POST -T "application/json" -d '{"car_id":"1","location_of_rental_id":2,"location_of_return_id":2,"date_of_booking":"2023-04-13","date_of_rental":"2023-04-13","date_of_return":"2023-04-20","method_of_payment":"AMERICAN_EXPRESS","card_number":"2323423423423423","card_security_code":"332","valid_until":"2027-04-01","first_name":"Nichil","last_name":"Strasser","email":"nichil.strasser@gmail.com","order_status":"CREATED"}' 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/order' > /dev/null &

echo Waiting 15s for metrics to be available
sleep 15

export KUBECONFIG=/Users/nichil/Studies/mat-infra/azure/mat-project-2110838008-argo-kube.conf
echo Starting upgrade of api-gateway
date '+%Y-%m-%d %H:%M:%S'

CHART_HOME=../../../mat-deploy/argo/app
helm upgrade -i api-gateway "$CHART_HOME/09-api-gateway" -n car-rental --atomic

echo Helm upgrade operation completed 

sleep 5
kubectl argo rollouts status api-gateway -n car-rental
echo "Completed at $(date '+%Y-%m-%d %H:%M:%S')"





# ./use-case-2.sh
# Started at 2023-04-15 21:00:34
# Waiting 15s for metrics to be available
# Starting upgrade of api-gateway
# 2023-04-15 21:00:49
# Release "api-gateway" has been upgraded. Happy Helming!
# NAME: api-gateway
# LAST DEPLOYED: Sat Apr 15 21:00:50 2023
# NAMESPACE: car-rental
# STATUS: deployed
# REVISION: 2
# TEST SUITE: None
# Helm upgrade operation completed
# Paused - CanaryPauseStep
# Progressing - more replicas need to be updated
# Progressing - waiting for all steps to complete
# Paused - CanaryPauseStep
# Progressing - waiting for all steps to complete
# Paused - CanaryPauseStep
# Progressing - waiting for all steps to complete
# Paused - CanaryPauseStep
# Progressing - waiting for all steps to complete
# Paused - CanaryPauseStep
# Progressing - waiting for all steps to complete
# Healthy
# Completed at 2023-04-15 21:04:34
# ./use-case-2.sh: line 41: 66144 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/' > /dev/null
# ./use-case-2.sh: line 41: 66145 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/runtime.8f4b81746d1eff2a.js' > /dev/null
# ./use-case-2.sh: line 41: 66146 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/polyfills.52efa3afb022db2a.js' > /dev/null
# ./use-case-2.sh: line 41: 66147 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/main.8cc27cdf81a7ee9d.js' > /dev/null
# ./use-case-2.sh: line 41: 66148 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/styles.69fb83f21957d6ac.css' > /dev/null
# ./use-case-2.sh: line 41: 66149 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/fleet.jpeg' > /dev/null
# ./use-case-2.sh: line 41: 66150 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/seats.png' > /dev/null
# ./use-case-2.sh: line 41: 66151 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/gear.png' > /dev/null
# ./use-case-2.sh: line 41: 66152 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/km.png' > /dev/null
# ./use-case-2.sh: line 41: 66153 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/suitcase_big.png' > /dev/null
# ./use-case-2.sh: line 41: 66154 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/favicon.ico' > /dev/null
# ./use-case-2.sh: line 41: 66155 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/banner.a43723b07eefb65d.jpg' > /dev/null
# ./use-case-2.sh: line 41: 66156 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/car?currencySymbol=USD' > /dev/null
# ./use-case-2.sh: line 41: 66157 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/currency' > /dev/null
# ./use-case-2.sh: line 41: 66158 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/location' > /dev/null
# ./use-case-2.sh: line 41: 66159 Terminated: 15          hey -c 10 -z 10m -o csv -m POST -T "application/json" -d '{"car_id":"1","location_of_rental_id":2,"location_of_return_id":2,"date_of_booking":"2023-04-13","date_of_rental":"2023-04-13","date_of_return":"2023-04-20","method_of_payment":"AMERICAN_EXPRESS","card_number":"2323423423423423","card_security_code":"332","valid_until":"2027-04-01","first_name":"Nichil","last_name":"Strasser","email":"nichil.strasser@gmail.com","order_status":"CREATED"}' 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/order' > /dev/nul