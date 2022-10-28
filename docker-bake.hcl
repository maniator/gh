// docker-bake.hcl
variable "IMAGE_NAME" { default="gh:latest" }
variable "GH_VERSION" { default="latest" }

group "default" {
  targets = ["build"]
}

target "docker-metadata-action" {}

target "builder" {
  context = "."
  dockerfile = "Dockerfile"
  target = "gh"
  args = {
    GH_VERSION: GH_VERSION,
  }
  tags = [
    IMAGE_NAME
  ]
}

target "build" {
  inherits = ["builder", "docker-metadata-action"]
  platforms = [
    "linux/amd64",
    "linux/arm/v6",
    "linux/arm/v7",
    "linux/arm64/v8"
  ]
}
