## Dockerized github cli

Simple container running in alpine Linux to run the github cli seamlessly for use anywhere

Very useful in projects using docker in their CI processes

[![DockerHub Badge](http://dockeri.co/image/maniator/gh)](https://hub.docker.com/r/maniator/gh/)

### Github Repo

https://github.com/serveside/gh

### Docker image tags

https://hub.docker.com/r/maniator/gh/tags/

### Usage

```shell
docker run -it --rm -v ${HOME}:/root -v $(pwd):/gh -e GITHUB_TOKEN=<token> maniator/gh <command>
```

### Optional alias:

    alias gh="docker run -ti --rm -v ${HOME}:/root -v $(pwd):/gh maniator/gh"

for example, if you need clone this repository, with the alias you just set, you can run it as local command

    gh repo clone serveside/gh
