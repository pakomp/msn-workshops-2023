---
marp: true
paginate: true
backgroundColor: #fff
theme: gaia
---

![bg left:40% 80%](https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Kubernetes_logo_without_workmark.svg/84px-Kubernetes_logo_without_workmark.svg.png)

# **Kubernetes**

Kubernetes, also known as K8s, is an open-source system for automating deployment, scaling, and management of containerized applications.

https://github.com/pakomp/msn-workshops-2023

---

# Punkter

* Kubernetes
    Vad är kubernetes?
    https://kubernetes.io/docs/concepts/

* Deployment/Pod
    Hur man bygger en docker image
    
* Service/Ingress

* docker-compose
    Hur man kan paketera flera docker images och deras inställningar
    till en komplett applikation

---
# Kubernetes
<iframe width="1100" height="720px" src="https://www.youtube-nocookie.com//embed/PziYflu8cB8?end=113"></iframe>

---
# Deployment/Pod
<iframe width="1100" height="720px" src="https://www.youtube-nocookie.com/embed/iC-WxZGhFqs?start=0&end=287"></iframe>

---
# Service/Ingress
<iframe width="1100" height="720px" src="https://www.youtube-nocookie.com//embed/NPFbYpb0I7w?start=13&end=330"></iframe>

https://youtu.be/NPFbYpb0I7w?t=12
https://youtu.be/NPFbYpb0I7w?t=330
---
https://www.youtube-nocookie.com/embed/iC-WxZGhFqs?start=0&end=287
https://youtu.be/iC-WxZGhFqs?t=287
kubectl port-forward deployment/hello-deployment 8080:80
# Docker installation
### Windows
```
winget install docker.dockerdesktop
```
### Linux
```
sudo wget -qO- get.docker.com|bash
```

# Docker test
```
docker run busybox date
```
---
# Dockerfile
* Dockerfile 
    Hur man bygger en docker image
    https://docs.docker.com/engine/reference/builder
---
# Dockerfile
<iframe width="1100" height="720px" src="https://www.youtube-nocookie.com//embed/SnSH8Ht3MIc?end=1049"></iframe>

---
# Dockerfile
### [docker cli](https://docs.technotim.live/posts/custom-docker-image/#docker-commands)
#### docker build -t msn-image .
#### docker run -d -p 80:80 --name msn-container --rm msn-image 
#### docker stop msn-container
---
# Dockerfile
### [dockerfile](https://docs.docker.com/engine/reference/builder/)
### Uppgift 1
+ Lägg till en ny bild med [ADD](https://docs.docker.com/engine/reference/builder/#add) från https://picsum.photos/200
+ Lägg till ytterligare en bild via [RUN](https://docs.docker.com/engine/reference/builder/#run) istället
```
wget https://picsum.photos/200 -O src/html/pic.png
curl -sS https://picsum.photos/200 -o src/html/pic.png
```
+ Uppdatera index.html så den visar de två nya bilderna
---
# Dockerfile
### [dockerfile](https://docs.docker.com/engine/reference/builder/)
### Uppgift 2
+ Använd [ARG](https://docs.docker.com/engine/reference/builder/#arg) för att skapa en variabel som kan ersätta storleken på bilden som hämtas från picsum
```
ARG size=200

```
---
# docker-compose
* docker-compose
    Hur man kan paketera flera docker images och deras inställningar
    till en komplett applikation
    https://docs.docker.com/compose/compose-file/
---    
# docker-compose
<iframe width="1100" height="720px" src="https://www.youtube-nocookie.com//embed/qH4ZKfwbO8w?start=122&end=1084"></iframe>

---    
# docker-compose
### Uppgift 1
+ Lägg till en ny [wordpress](https://hub.docker.com/_/wordpress) service som är kopplad till en [mysql](https://hub.docker.com/_/mysql) databas
---
# docker-compose
#### mysql env
```
      - MYSQL_DATABASE=wordpress
      - MYSQL_USER=wordpress
      - MYSQL_PASSWORD=wordpress
```
#### wordpress env
```
      - WORDPRESS_DB_HOST=db
      - WORDPRESS_DB_NAME=wordpress
      - WORDPRESS_DB_USER=wordpress
      - WORDPRESS_DB_PASSWORD=wordpress
```
---
# docker-compose
### Uppgift 2
+ Lägg till ytterligare en webserver liknande servicen som använda vår egna lokala nginx image via [build](https://docs.docker.com/compose/compose-file/build/)
```
services:
  msn-webserver:
    build:
```
---
# WK
### Nu borde ni kunna följa hur laravel sail är uppbyggd i wk-api
+ [wk-api/docker/8.1/Dockerfile](https://gitlab.com/msn4/wk-api/-/blob/develop/docker/8.1/Dockerfile)
+ [wk-api/docker-compose.yml](https://gitlab.com/msn4/wk-api/-/blob/develop/docker-compose.yml)

### Eller hur utveckling burkarna för WK2 skapas
+ [ldocker/php8-wk/Dockerfile](https://gitlab.com/mysalary/docker/ldocker/-/blob/main/php8-wk/Dockerfile)
---
# Extra 

* Ytterligare [dockerfile](https://docs.docker.com/engine/reference/builder/) kommandon WORKDIR/USER/CMD/ENTRYPOINT

* (optional) composerize
    Omvandla docker cli kommandon till docker-compose yaml syntax
    <https://www.composerize.com/>

* (advanced) docker [networks](https://www.youtube-nocookie.com//embed/bKFMS5C4CG0?start=149)
    Skapa olika tycker av nätverk för att separera workload från varandra
