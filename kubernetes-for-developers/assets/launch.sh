echo "Starting Kubernetes..."
while [ `docker ps | wc -l` -eq 1 ]
do
  sleep 1
done
apt install socat
kubectl create ns dev && kubectl create ns test && /usr/bin/get_helm.sh && helm init && kubectl completion bash > bash_completion && helm completion bash >> bash_completion && echo done >> /opt/katacoda-completed
kubectl run kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080 --replicas=4 && kubectl expose deployments/kubernetes-bootcamp --type="NodePort" --port 8080 >> /opt/katacoda-completed

echo "Kubernetes Started"
