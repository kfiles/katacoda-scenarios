## Deploying a new application

Let's deploy another application. Take a look at `/root/httpbin-1.yaml`. It contains the definition of both a Service and a Deployment (multiple specifications can be put into a single file).

Now lets create this new service:

`kubectl create -f /root/httpbin-1.yaml`{{execute T1}}

Check that the new service has been created:

`kubectl get svc httpbin    `{{execute T1}}

Now look for the pods bound to this service. Both the service and the pods have a label `app=httpbin`. We can use a label selector to find the pods:

`kubectl get pod -l app=httpbin`{{execute T1}}
