echo $1
source $1

if ! kubectl get ns $OWNER > /dev/null 2>&1; then
   kubectl create namespace $OWNER
fi

envsubst < whoami-template.yml | kubectl apply --namespace=$OWNER -f -