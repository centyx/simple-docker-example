# Simple Docker Example

Example Dockerfile to run aws cli and nmap.

This container
- Uses [alpine docker image](https://hub.docker.com/_/alpine) as base
- Installs a few basic programs, nmap, and python via Alpine package manager
- Installs AWS CLI via python pip
- Copies some local files from the ./scripts directory to /usr/local/bin in the container
- Runs the /usr/local/bin/runcmd script and exits

Note on scripts/ folder. The scripts here are intentionally blank. Someone would
populate them as needed and edit runcmd to tie them together.

## Building the container image

Clone this repo and build a local container image named "simple-docker-example"

```
git clone git@github.com:centyx/simple-docker-example.git
cd simple-docker-example/
docker build --tag simple-docker-example ./
```

List all installed images. You will see simple-docker-example, as well as the alpine one
in the list.

```
docker image ls --all
```

### Running a container from the image

```
docker run --interactive --tty simple-docker-example \
  -v ~/.aws:/root/.aws  # share the host ~/.aws/ folder as /root/.aws/ in the container
```

List all containers, even stopped ones. You will see simple-docker-example in the list.

```
docker container ps --all
```

