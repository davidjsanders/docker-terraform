# docker-terraform
Docker customized terraform image based on HashiCorp's [community image](https://hub.docker.com/r/hashicorp/terraform). The image contains the following additions to HashiCorp's image:

1. The entrypoint is a script: `/scripts/entrypoint.sh`
2. The entrypoint checks if the first argument is `--help` (or any variation, e.g. `--HeLp`); if it is, then guidance is shown on how to use the image *and* the terraform command
3. Three volumes are exposed:
  * `/data` - the working directory where scripts are expected to be found
  * `/secrets` - a location where secrets are expected to be found, e.g. credential tf vars files
  * `/ssh` - a location where ssh files are expected, usually bound mapped to `~/.ssh`
4. The edge mirrors are added to `/etc/apk/repositories` to enable latest updates (main and community) to be found
5. The curl command is installed to enable outbound access to resources (e.g. modifying Google Domains DDNS)

## Why a custom image?
While the HashiCorp terraform image on Docker Hub works well, I wanted more control over key components which would be present any time I wanted to run the image.