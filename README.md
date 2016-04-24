# gabrielrezzonico/docker-node

Dockerfile to create a Docker container image with nodejs installed.

## Docker image user and group

See base image gabrielrezzonico/docker-debian

## Run

### Container with a bash with node installed:

```bash
docker run -it --rm -v ~/workspace/docker-node/test-project:/home/docker-user/workspace/docker-node/test-project \
                    -w /home/docker-user/workspace/docker-node/test-project gabrielrezzonico/docker-node:0.0.1
```

### Container running in the background a node script located in the host  (script: server.js, path on host: ~/workspace/docker-node/test-project)

```bash
 docker run -it -d -v ~/workspace/docker-node/test-project:/home/docker-user/workspace/docker-node/test-project \
                    -p 3000 \
                    -w /home/docker-user/workspace/docker-node/test-project gabrielrezzonico/docker-node:0.0.1 \
                    -c "/home/docker-user/.nvm/versions/node/v5.6.0/bin/node server.js"
```

### Map container port 3000 to host port 80

```bash
 docker run -it -d -v ~/workspace/docker-node/test-project:/home/docker-user/workspace/docker-node/test-project \
                    -p 80:3000 \
                    -w /home/docker-user/workspace/docker-node/test-project gabrielrezzonico/docker-node:0.0.1 \
                    -c "/home/docker-user/.nvm/versions/node/v5.6.0/bin/node server.js"
```

## Extra packages

The following packages are installed (on top of the base image):

> * build-essential
> * libssl-dev

The image also have nvm and node packages installed.
 