## ConfigMaps

ConfigMaps store data in key-value pairs, and can be used to separate dynamic configuration from Docker containers. A ConfigMap value can replace data as simple as an Environment variable, or as complex as an entire config file within the container.

Creating a simple ConfigMap with just one value is easy:

`kubectl create configmap special-config --from-literal=special.how=very`{{execute T1}}

Here's what the resulting ConfigMap looks like:

`kubectl get configmap special-config -o yaml`{{execute T1}}

We can also ingest an entire property file as our config. This is useful for injecting a config file into a container, making it easier to update dynamically.

`kubectl create configmap logging-config --from-file=/root/logback.xml`{{execute T1}}

`kubectl get configmap logging-config -o yaml`{{execute T1}}

## Using ConfigMaps in Pods

How can we use these ConfigMaps? Let's consider the first ConfigMap, containing environment variables. Running a pod which uses this ConfigMap:

`kubectl create -f /root/special.yaml`{{execute T1}}

For our ConfigMap creating from a full logback.xml config file, we want to mount that file in a Volume within the container. The example Pod below does just that:

`kubectl create -f /root/logtest.yaml`{{execute T1}}

## Conclusion

ConfigMaps are a powerful way to inject configuration into containers, and allow us to dynamically update environment variables and config files while the container is running. They are easy to create from legacy configurations, and should be used to segregate all configuration data from your deployed images.