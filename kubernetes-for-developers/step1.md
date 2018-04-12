## Enable Autocompletion

`source bash_completion`{{execute T1}}

## Deployments and Pods

Application containers are configured as a Deployment in Kubernetes. The Deployment takes care of managing replication (high-availability through scheduling pods on multiple nodes), executing healthchecks on the container, and restarting pods which die.

kubectl is the single command you need to check cluster status, deploy new services, and view logs. Let’s start looking around. 

`kubectl get namespaces`{{execute T1}}

In Kubernetes, namespaces provide separate environments within a cluster. As you can see, we have setup an environment for both dev and test. Feature branches will be built to dev. Pull requests will be deployed to the integration environment in the test namespace.

To see the current deployments, execute the following command:

`kubectl get deployments`{{execute T1}}

As you can see, we have 4 out of 4 pods up and running for the Deployment kubernetes-bootcamp.

Try:

`kubectl get svc`{{execute T1}}

The service is the named endpoint, which provides a ClusterIP which other pods can use to communicate with this application. Within this Kubernetes cluster, any connection to the `kubernetes-bootcamp` service will be routed to this ClusterIP, and connected to one of the available pods belonging to the service.

You can also see more details of the service with the following command:

`kubectl describe svc kubernetes-bootcamp`{{execute T1}}

The full specification of the service can be retrieved in yaml or json output format as well:

`kubectl get svc kubernetes-bootcamp -o yaml`{{execute T1}}

Now lets see all the pods which have been created to provide this service. They have been scheduled on multiple nodes, and provide both load-balancing, and high-availability. Connections to the service will only be delegated to healthy pods.

`kubectl get pods`{{execute T1}}