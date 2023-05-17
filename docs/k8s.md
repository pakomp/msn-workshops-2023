---
marp: true
paginate: true
backgroundColor: #fff
theme: gaia
---

![bg left:40% 80%](https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg)

# **Kubernetes**

Kubernetes, also known as K8s, is an open-source system for automating deployment, scaling, and management of containerized applications.

https://github.com/pakomp/msn-workshops-2023

---

# Punkter

* Kubernetes
    Vad är kubernetes?

* Deployment/Pod
    Hur körs containers i k8s
    
* Service/Ingress
    Hur kommer man åt sina containers

* Helm
    Paketera deployment/service/ingress och samla inställningar på ett ställe
    
---
# Kubernetes
<iframe width="1100" height="720px" src="https://www.youtube-nocookie.com//embed/PziYflu8cB8?end=113"></iframe>

---
# Kubernetes 
### Uppgift 1
+ Installera k8s kluster
    * Stäng ner Docker Desktop på windows och se till man är i en wsl prompt

    * Installera k8s dev kluster
        * k8s/bin/start.sh

---
# Kubernetes 
### Uppgift 1
* Om allt gick bra så borde den säga att "default" är ens kube context och vad ens lastbalanserar ip är
    * kubectl get deployments -A
    * kubectl get services -A

---
# Deployment/Pod
<iframe width="1100" height="720px" src="https://www.youtube-nocookie.com/embed/iC-WxZGhFqs?start=0&end=287"></iframe>

---
# Deployment/Pod
    https://kubernetes.io/docs/concepts/
### Uppgift 2
* Installera vår docker app som en deployment
    * kubectl apply -f deployment.yaml
* Kontrollera att den startat
* Ändra antalet pods från 3 till 2

---
# Service/Ingress
<iframe width="1100" height="720px" src="https://www.youtube-nocookie.com//embed/NPFbYpb0I7w?start=13&end=330"></iframe>

---
# Service
### Uppgift 3
* Installera en service för vår app så vi kan nå den
    * kubectl apply -f service.yaml
* Kontrollera att servicen har startat ok
    * kubectl describe service hello-service
    * endpoints (hittade pods att skicka trafik till)    
    * loadbalancer ingress (fått ett externt ip, där porten vi vill ha är ledig)

---
# Service
### Uppgift 3
* Anslut till tjänsten 
    * kubectl get service hello-service -o json|jq '.status.loadBalancer.ingress[0].ip'
    * kubectl get service hello-service -o json|jq '.spec.ports[0].port'

---
# Ingress
### Uppgift 4
* Installera en ingress regel för vår app så vi kan nå den via http/https
    * kubectl apply -f ingress.yaml
    * kubectl get ingress
* Efter att man testat så http/https fungerar ändra servicens typ till ClusterIP då vi inte längre behöver en egen port för den på 8080
    * kontrollera att den inte längre svara på 8080 men fortfarande fungerar på http/https

---
# Helm

---
# Helm
### Uppgift 5
* Rensa de manuellt skapade okjekten
    * kubectl delete deployment hello-deployment
    * kubectl delete service hello-service
    * kubectl delete ingress hello-ingress
### Uppgift 6
* Skapa en ny helm chart
    * helm create hello-chart

---
# Helm
### Uppgift 6
* Installera vår app med en ingress precis som i uppgift 4
    * helm upgrade --install hello-helm hello-chart -f helm-ingress.yaml
    * om man vill sätta upp ett host entry för sin ip mot "k3s.local" så kan man avkommentera den raden i helm-ingress.yaml och prova att man bara när appen på just den urlen
* Ändra till en loadbalancer istället som i uppgift 3
    * helm upgrade --install hello-helm hello-chart -f helm-ingress.yaml -f helm-lb.yaml

---
# Helm
### Uppgift 6
* Titta vilka inställningar en chart kör med
    * helm get values hello-helm
    * helm get values hello-helm -a
* Avinstallera vår app
    * helm uninstall hello-helm

---
# Extra
* Titta vad helm create skapade i hello-chart katalogen och hur värden från values.yaml används på olika ställen i templates
* Titta på hello-chart/values.yaml och hur vi sedan kör overrides på den via helm-ingress.yaml och helml-lb-yaml
* Skapa en yaml fil som aktiverar autoscaling istället för att ha en fast replicaCount