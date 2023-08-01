## Dockerized github cli

Simple container running in alpine Linux to run the github cli seamlessly for use anywhere

Very useful in projects using docker in their CI processes

[![DockerHub Badge](http://dockeri.co/image/maniator/gh)](https://hub.docker.com/r/maniator/gh/)

### Github Repo

https://github.com/maniator/gh

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

### Kubernetes usage

```yaml
apiVersion: apps/v1
kind: Deployment
spec:
  template:
    spec:
      containers:
      - name: containers-images
        image: images-names:v1.0.0
        volumeMounts:
          - name: vc-theme
            mountPath: /opt/themes/custom
      initContainers:
        - name: git
          image: maniator/gh:latest
          env:
            - name: GITHUB_TOKEN
              value: "ghp_xxxxxxxxx"
          command: ["sh", "-c"]
          args: ["gh auth setup-git --hostname github.com && git clone https://github.com/username/theme.git"]
          volumeMounts:
            - name: vc-theme
              mountPath: /gh/theme
      volumes:
        - name: vc-theme
          emptyDir: {}
```
