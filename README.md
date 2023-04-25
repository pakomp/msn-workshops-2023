# workshops-2023-docker
<Intro>
Hur man skapar en docker image: Dockerfile

[![Dockerfile](https://user-images.githubusercontent.com/4668945/234217051-71d114c3-ead4-4945-9ee4-ca14c941571a.png)](https://www.youtube.com/watch?v=SnSH8Ht3MIc "Dockerfile")

Användbara kommandon WORKDIR/COPY/RUN/USER

Avancerad https://docs.docker.com/engine/reference/builder/#exec-form-entrypoint-example
FROM ubuntu
ENTRYPOINT ["top", "-b"]
CMD ["-c"]

Omvandla docker run till compose syntax
composerize <https://www.composerize.com/>

Flera services/depends on
build/ports/network/volumes
