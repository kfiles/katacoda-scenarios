while [ \`docker ps | wc -l\` -eq 1 ]; do sleep 1; done && kubectl run kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080 --replicas=4 && kubectl expose deployments/kubernetes-bootcamp --type="NodePort" --port 8080 && echo done >> /opt/katacoda-completed
/usr/bin/get_helm.sh && helm init
helm completion bash > bash_completion
. bash_completion
