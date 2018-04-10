## Deployments and Pods

Application containers are configured as a Deployment in Kubernetes. The Deployment takes care of managing replication (high-availability through scheduling pods on multiple nodes), executing healthchecks on the container, and restarting pods which die.

To see the current deployments, execute the following command:

`kubectl get deployments`{{execute T1}}

As you can see, we have 4 out of 4 pods up and running for the Deployment kubernetes-bootcamp.

Try:

`kubectl get svc`{{execute T1}}

The service is the named endpoint, which provides a ClusterIP which other pods can use to communicate with this application. Within this Kubernetes cluster, any connection to the `kubernetes-bootcamp` service will be routed to this ClusterIP, and connected to one of the available pods belonging to the service.

## Deploying a new application

Let's deploy another application. Take a look at `/root/httpbin-1.yaml`. It contains the definition of both a Service and a Deployment (multiple specifications can be put into a single file).

Now lets create this new service:

`kubectl create -f /root/httpbin-1.yaml`{{execute T1}}

Check that the new service has been created:

`kubectl get svc httpbin-v1`{{execute T1}}

Now look for the pods bound to this service. Both the service and the pods have a label `app=httpbin`. We can use a label selector to find the pods:

`kubectl get pod -l app=httpbin`{{execute T1}}
