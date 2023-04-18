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
echo Starting upgrade of frontend
date '+%Y-%m-%d %H:%M:%S'

CHART_HOME=../../../mat-deploy/argo/app
helm upgrade -i frontend "$CHART_HOME/10-frontend" -n car-rental --atomic

echo Helm upgrade operation completed 

sleep 5
kubectl argo rollouts status frontend -n car-rental
echo "Completed at $(date '+%Y-%m-%d %H:%M:%S')"



# ./use-case-1.sh
# Started at 2023-04-15 20:53:39
# Waiting 15s for metrics to be available
# Starting upgrade of frontend
# 2023-04-15 20:55:54
# Release "frontend" has been upgraded. Happy Helming!
# NAME: frontend
# LAST DEPLOYED: Sat Apr 15 20:55:55 2023
# NAMESPACE: car-rental
# STATUS: deployed
# REVISION: 3
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
# Completed at 2023-04-15 20:58:43
# ./use-case-1.sh: line 68: 65524 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/' > /dev/null
# ./use-case-1.sh: line 68: 65525 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/runtime.8f4b81746d1eff2a.js' > /dev/null
# ./use-case-1.sh: line 68: 65526 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/polyfills.52efa3afb022db2a.js' > /dev/null
# ./use-case-1.sh: line 68: 65527 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/main.8cc27cdf81a7ee9d.js' > /dev/null
# ./use-case-1.sh: line 68: 65528 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/styles.69fb83f21957d6ac.css' > /dev/null
# ./use-case-1.sh: line 68: 65529 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/fleet.jpeg' > /dev/null
# ./use-case-1.sh: line 68: 65530 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/seats.png' > /dev/null
# ./use-case-1.sh: line 68: 65531 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/gear.png' > /dev/null
# ./use-case-1.sh: line 68: 65532 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/km.png' > /dev/null
# ./use-case-1.sh: line 68: 65533 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/suitcase_big.png' > /dev/null
# ./use-case-1.sh: line 68: 65534 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/favicon.ico' > /dev/null
# ./use-case-1.sh: line 68: 65535 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/banner.a43723b07eefb65d.jpg' > /dev/null
# ./use-case-1.sh: line 68: 65536 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/car?currencySymbol=USD' > /dev/null
# ./use-case-1.sh: line 68: 65537 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/currency' > /dev/null
# ./use-case-1.sh: line 68: 65538 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/location' > /dev/null
# ./use-case-1.sh: line 68: 65539 Terminated: 15          hey -c 10 -z 10m -o csv -m POST -T "application/json" -d '{"car_id":"1","location_of_rental_id":2,"location_of_return_id":2,"date_of_booking":"2023-04-13","date_of_rental":"2023-04-13","date_of_return":"2023-04-20","method_of_payment":"AMERICAN_EXPRESS","card_number":"2323423423423423","card_security_code":"332","valid_until":"2027-04-01","first_name":"Nichil","last_name":"Strasser","email":"nichil.strasser@gmail.com","order_status":"CREATED"}' 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/order' > /dev/null