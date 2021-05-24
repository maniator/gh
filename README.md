## Dockerized gh cli

```shell
docker run -it --rm -v $(pwd):/gh -e GITHUB_TOKEN=<token> maniator/gh <command>
```
