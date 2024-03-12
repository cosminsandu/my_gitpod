# gitpod

<!-- TOC -->
* [gitpod](#gitpod)
  * [Init a gitpod env](#init-a-gitpod-env)
  * [Docker Images](#docker-images)
  * [Custom Dockerfile](#custom-dockerfile)
  * [gitpod user](#gitpod-user)
<!-- TOC -->

## Init a gitpod env
1. Add a `.gitpod.yml` at the root of your repository.<br>(or run `gp init` to generate the `.gitpod.yml` file.)
2. Use the `gp validate` command to validate your configuration is working.
3. Commit and push to apply the configuration for all subsequent workspace starts.

## Docker Images
By default, Gitpod uses a standard Docker Image called [`Workspace-Full`](https://hub.docker.com/r/gitpod/workspace-full) as the foundation for workspaces.
The official Gitpod Docker images are hosted on[Docker Hub](https://hub.docker.com/u/gitpod).
You can find the source code for these images in [this GitHub repository](https://github.com/gitpod-io/workspace-images/).
If you want a base image without the default tooling installed then use the [gitpod/workspace-base](https://hub.docker.com/r/gitpod/workspace-base) image.

To use docker images, define a public Docker image in your `.gitpod.yml` file with the following configuration:
```yaml
image: gitpod/workspace-base:latest
```

## Custom Dockerfile
This option provides you with the most flexibility.

Add the following configuration in your `.gitpod.yml` file:
```yaml
image:
    file: .gitpod.Dockerfile
```

Create `.gitpod.Dockerfile` witht the custome Dockerfile instruction(s).

## gitpod user
When you launch a Gitpod workspace, the local console will use the `gitpod` user,
so all local settings, config file, etc. should apply to `/home/gitpod` or be run using `USER gitpod`.

You can however use `sudo` in your Dockerfile.
