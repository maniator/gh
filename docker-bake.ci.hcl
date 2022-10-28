variable "DOCKER_META_VERSION" { default="" }

group "default" {
    targets = ["ci_build"]
}

target "ci_build" {
  inherits = ["build", "docker-metadata-action"]
  tags = [
    "maniator/gh:GH_VERSION",
    "maniator/gh:latest",
  ]
}
