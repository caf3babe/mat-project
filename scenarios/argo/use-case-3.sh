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
echo Starting upgrade of micro services
date '+%Y-%m-%d %H:%M:%S'

CHART_HOME=../../../mat-deploy/argo/app
helm upgrade -i currency-service "$CHART_HOME/03-currency-service" -n car-rental --atomic
helm upgrade -i car-service "$CHART_HOME/04-car-service" -n car-rental --atomic
helm upgrade -i location-service "$CHART_HOME/05-location-service" -n car-rental --atomic
helm upgrade -i order-service "$CHART_HOME/07-order-service" -n car-rental --atomic

echo Helm upgrade operation completed 

sleep 5
kubectl argo rollouts status currency-service -n car-rental
kubectl argo rollouts status car-service -n car-rental
kubectl argo rollouts status location-service -n car-rental
kubectl argo rollouts status order-service -n car-rental
echo "Completed at $(date '+%Y-%m-%d %H:%M:%S')"









# Started at 2023-04-15 21:38:31
# Waiting 15s for metrics to be available
# Starting upgrade of micro services
# 2023-04-15 21:38:46
# Release "currency-service" has been upgraded. Happy Helming!
# NAME: currency-service
# LAST DEPLOYED: Sat Apr 15 21:38:47 2023
# NAMESPACE: car-rental
# STATUS: deployed
# REVISION: 5
# TEST SUITE: None
# Release "car-service" has been upgraded. Happy Helming!
# NAME: car-service
# LAST DEPLOYED: Sat Apr 15 21:38:52 2023
# NAMESPACE: car-rental
# STATUS: deployed
# REVISION: 5
# NOTES:
# 1. Get the application URL by running these commands:
#   export NODE_PORT=$(kubectl get --namespace car-rental -o jsonpath="{.spec.ports[0].nodePort}" services car-service)
#   export NODE_IP=$(kubectl get nodes --namespace car-rental -o jsonpath="{.items[0].status.addresses[0].address}")
#   echo http://$NODE_IP:$NODE_PORT
# Release "location-service" has been upgraded. Happy Helming!
# NAME: location-service
# LAST DEPLOYED: Sat Apr 15 21:38:58 2023
# NAMESPACE: car-rental
# STATUS: deployed
# REVISION: 5
# TEST SUITE: None
# Release "order-service" has been upgraded. Happy Helming!
# NAME: order-service
# LAST DEPLOYED: Sat Apr 15 21:39:03 2023
# NAMESPACE: car-rental
# STATUS: deployed
# REVISION: 5
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
# Progressing - waiting for all steps to complete
# Paused - CanaryPauseStep
# Progressing - waiting for all steps to complete
# Healthy
# Paused - CanaryPauseStep
# Progressing - waiting for all steps to complete
# Paused - CanaryPauseStep
# Progressing - waiting for all steps to complete
# Paused - CanaryPauseStep
# Progressing - waiting for all steps to complete
# Healthy
# Paused - CanaryPauseStep
# Progressing - waiting for all steps to complete
# Healthy
# Completed at 2023-04-15 21:43:47
# ./use-case-3.sh: line 46: 71877 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/' > /dev/null
# ./use-case-3.sh: line 46: 71878 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/runtime.8f4b81746d1eff2a.js' > /dev/null
# ./use-case-3.sh: line 46: 71879 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/polyfills.52efa3afb022db2a.js' > /dev/null
# ./use-case-3.sh: line 46: 71880 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/main.8cc27cdf81a7ee9d.js' > /dev/null
# ./use-case-3.sh: line 46: 71881 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/styles.69fb83f21957d6ac.css' > /dev/null
# ./use-case-3.sh: line 46: 71882 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/fleet.jpeg' > /dev/null
# ./use-case-3.sh: line 46: 71883 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/seats.png' > /dev/null
# ./use-case-3.sh: line 46: 71884 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/gear.png' > /dev/null
# ./use-case-3.sh: line 46: 71885 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/km.png' > /dev/null
# ./use-case-3.sh: line 46: 71886 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/assets/suitcase_big.png' > /dev/null
# ./use-case-3.sh: line 46: 71887 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/favicon.ico' > /dev/null
# ./use-case-3.sh: line 46: 71888 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/banner.a43723b07eefb65d.jpg' > /dev/null
# ./use-case-3.sh: line 46: 71889 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/car?currencySymbol=USD' > /dev/null
# ./use-case-3.sh: line 46: 71890 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/currency' > /dev/null
# ./use-case-3.sh: line 46: 71891 Terminated: 15          hey -c 10 -z 10m -o csv 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/location' > /dev/null
# ./use-case-3.sh: line 46: 71892 Terminated: 15          hey -c 10 -z 10m -o csv -m POST -T "application/json" -d '{"car_id":"1","location_of_rental_id":2,"location_of_return_id":2,"date_of_booking":"2023-04-13","date_of_rental":"2023-04-13","date_of_return":"2023-04-20","method_of_payment":"AMERICAN_EXPRESS","card_number":"2323423423423423","card_security_code":"332","valid_until":"2027-04-01","first_name":"Nichil","last_name":"Strasser","email":"nichil.strasser@gmail.com","order_status":"CREATED"}' 'http://matproject2110838008-car-rental.westeurope.cloudapp.azure.com/api/v1/order' > /dev/nul