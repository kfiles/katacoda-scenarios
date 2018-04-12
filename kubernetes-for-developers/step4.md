##Packaging with Helm

We have worked with a few Kubernetes descriptor files: Pods, Deployments, Services, and ConfigMaps. There are some others, as well: PersistentVolumeClaims, Secrets, and Ingress.

Editing all of these files and deploying each part of the application could get a little tedious. Fortunately, there is an alternative.

Helm is a tool for managing packages: collections of descriptor file templates, along with their property values. Following the nautical theme, helm calls its packages "charts". It can work with local files or retrieve a chart from remote repositories.

Let's see what we can find:

`helm search stable`{{execute T1}}

There are a bunch of applications and Kubernetes add-ons which have been pre-packaged by the community. Let's try working with the Ghost publishing system.

`helm fetch stable/ghost`{{execute T1}}

What do we have here?

`tar xzf ghost*.tgz && ls ghost/templates`{{execute T1}}

A Helm chart is packaged up as a compressed tarball. Extracting it shows several templates for descriptor files: a ConfigMap, a Secret, a PersistentVolumeClaim (PVC), a Deployment, and a Service.

We can see what values these templates need, and check if we want to customize any of them:

`helm inspect ghost`{{execute T1}}

Installing this chart merely requires us to specify a unique Release name (so that the same application may be installed multiple times under different Release names).

`helm install --name ghost --set ghostName=ghost --set serviceType=NodePort ghost`{{execute T1}}

Here's what got deployed

`helm status ghost`{{execute T1}}

##Conclusion

Helm greatly simplifies the deployment of all of the artifacts we need to deploy in Kubernetes, and allows us to configure different values for the templates for each environment.