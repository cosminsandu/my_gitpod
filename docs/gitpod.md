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

Create `.gitpod.Dockerfile` with the custom Dockerfile instruction(s).

It is recommended to extend one of the [Gitpod-provided base images](https://hub.docker.com/u/gitpod/).

But it is possible to configure a Dockerfile with a public (Debian/Ubuntu-based) image as its base. There are some requirements for a public base image to work properly as a workspace. (e.g. you’ll need to set up the `gitpod` user with the right UID, and install `git`)

Additional tools & languages: see https://github.com/gitpod-io/workspace-images/tree/main/chunks for references to configure your workspace image with common tools and languages. For instance, [this Dockerfile](https://github.com/gitpod-io/workspace-images/blob/main/chunks/tool-docker/Dockerfile) shows how to install docker and docker-compose.


## gitpod user
When you launch a Gitpod workspace, the local console will use the `gitpod` user,
so all local settings, config file, etc. should apply to `/home/gitpod` or be run using `USER gitpod`.

You can however use `sudo` in your Dockerfile.
