## Deploying a new application

Let's deploy another application. Take a look at `/root/httpbin-1.yaml`. It contains the definition of both a Service and a Deployment (multiple specifications can be put into a single file).

Now lets create this new service:

`kubectl create -f /root/httpbin-1.yaml`{{execute T1}}

Look for the pods created for this deployment. Both the service and the pods have a label `app=httpbin`. We can use a label selector to find the pods:

`kubectl get pod -l app=httpbin -w`{{execute T1}}

The `-w` will cause the command to watch the status and continually update the pod deployment status.

We can watch the status change, as Kubernetes downloads the Docker image, creates the container, starts it, and waits for the pod to become ready to serve traffic. When you want to stop watching, hit Ctrl-C.

Check that the new service has been created:

`kubectl get svc httpbin`{{execute T1}}

Now lets send some traffic to this HTTP service, and check the logs to see the response. We'll have to fire up a container that can run curl:

`kubectl create -f /root/curl.yaml`{{execute T1}}

This mumbo-jumbo finds the dynamic name of the newly created pod:

`export CURL_POD=$(kubectl get pod -l app=curl -o jsonpath={.items..metadata.name})`{{execute T1}}

And now we can execute curl to connect to the httpbin service. As you can see, Kubernetes can execute a command within a container in almost the same way as Docker does.

`kubectl exec -it $CURL_POD -- sh -c 'curl http://httpbin:8080/headers'`{{execute T1}}

Great! Now we can see what happened in the logs of our httpbin pod. Find the name of the httpbin pod and run:

`export HTTP_POD=$(kubectl get pod -l app=httpbin -o jsonpath={.items..metadata.name})`{{execute T1}}

`kubectl logs $HTTP_POD`{{execute T1}}

There's another way to connect to a pod and browse its content: port-forwarding. This can be useful for checking the swagger docs, configuring an app via its management console, or doing remote Java debugging.

`kubectl port-forward $HTTP_POD 8080:8080 &`{{execute T1}}

The container's port 8080 is now accessible via our localhost. We can simply do a local curl command:

`curl localhost:8080/headers`{{execute T1}}

And once more verify from the logs that httpbin is responding to our requests:
`kubectl logs $HTTP_POD`{{execute T1}}

