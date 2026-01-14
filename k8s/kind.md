main benfits of having k8's is cloud agnostic

# tool to use k8's is kind(k8's inside docker)

# command to create cluster
kind create cluster --name local
# command to create cluster using congif.yml
kind create cluster --config clusters.yml --name local2
# command to delete cluster
kind delete cluster --name local
# cat ~/.kube/config  is used to check the credentails 

# kubectl is a command to used to send requests for api request by configuring the credentials which were ~/.kube/config
# kubectl which will be interacted with control plane(master node) to required operationd for tha pod

# kubectl is cli that automatically pics the credtianlf from ~./kube/config and send the desired reuests.

first u need to install kubectl 
1.kubectl get nodes -->fetch the nodes what all are present.
2.if u want to see what http requests were going on from kubectl
# kubectl get nodes --v=8
--->checking the verbosity this how talktive it was.
kubectl get pods -->used to get all pods.

# to create a pod
kubetctl run nginx --image=nginx --port=80

# note point 
You cannot create an empty Pod first and then “add a container later” into it.
And this is the key conceptual difference from Docker.
Why you can’t do that in Kubernetes
In Kubernetes:
A Pod must be created with its containers defined upfront.
So this idea is ❌ not possible:
Create empty pod
Later run nginx container inside it
Because:
Pods are immutable in structure
Once created, you cannot add/remove containers from an existing pod

# kubectl get pods -->used to check pods
kubectl get pods -o wide ---> used to checks pods only but in details like under which one node it created like that  

# command to delete pod ----> kubectl delete pod ingnix
#  command to check pod logs ----> kubectl  logs ingnix
# command to details of apod ----> kubectl describe pod ingnix 

the second option for creating pods is using the manigestfile(yml file)
todo --> manifesting

# Deployments 

# What is a Deployment in Kubernetes?
A Deployment is a Kubernetes object that says:
“Run my application, keep it running, and manage updates for me.”
That’s it.
Why Deployment exists
# Pods can:
Crash
Get deleted
Stop suddenly
# A Deployment makes sure:
Your app is always running
If a pod dies → new pod is created
If you change app version → update happens safely

# Simple definition
Deployment = A controller that manages Pods for you

# Example in real life
Think of YouTube app:
You tell Kubernetes:
Run 3 copies of YouTube server

# So Deployment will:
Run 3 pods
If 1 pod crashes → creates new one
If you update code → replaces old pods slowly with new ones
You don’t control pods directly.
You control the Deployment.

# Very simple flow
You → create Deployment
Deployment → creates Pods
Pods → run your app
# One-line memory trick
Pod runs ap
Deployment runs Pods
# What Deployment actually does (only these 3 things)
Keeps required number of pods running
Restarts pods if they fail
Updates pods safely when app changes
Nothing more.