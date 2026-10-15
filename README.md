<h1 align="center">Singularity Web</h1>
<p align="center"><strong>Unofficial</strong></p>

<p align="center">
  <img src="https://f.subo.dev/i/o/sd1.webp" alt="Screenshot from inside the Singularity Metaverse client contained within the Chromium web browser, showing a woman with a floating nametag 'Balthazar Swindon' staring out into empty landmass" />
</p>

Run **[Singularity Viewer][singularity]** in a web-accessible Docker/Podman container, similar to **Second Life Zero**. Built upon the [Selkies Linuxserver base image][selkies].

> [!WARNING]  
> This is **pre-pre-pre-alpha**. Use at your own risk. For Firestorm, [see the firestorm-docker repo](https://github.com/soup-bowl/firestorm-docker).

## Supported tags

Version refers to the [Singularity version](https://github.com/singularity-viewer/SingularityViewer/releases). **Tags outside of this are not updated**

- [`edge`, `1`, `1.8`, `1.8.9.8338`](https://github.com/soup-bowl/singularity-docker/blob/singularity/1.8/Dockerfile)

## Quickstart

> [!IMPORTANT]  
> This instruction gets you up and running, but comes with no security guardrails. **Use at your own risk**, and absolutely **do not use in a shared environment**.

To run the server, use the following command (or [see the Docker Compose file](/docker-compose.yml)):

```sh
docker run -d \
  --name singularity-web \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p 3000:3000 \
  -p 3001:3001 \
  ghcr.io/soup-bowl/singularity-web:edge
```

Add:

* `-v ./config:/config` for configuration persistence.
* `--security-opt seccomp=unconfined` for older systems with seccomp issues.
* `--device /dev/dri:/dev/dri` to give the container GPU access.
  * `--group-add video` may also be needed.

This will make an instance available on http://localhost:3000. For further configuration, see the [base image documentation][selkies].

## Updating Versions

Versions are defined in [`versions.json`](/versions.json), in a similar style to the [Docker Official Images](https://github.com/docker-library). The per-version Dockerfiles are generated from [`Dockerfile.template`](/Dockerfile.template), so do not edit them directly.

1. Add or bump the entry in `versions.json` (the key is the `major.minor` line, `version` is the full Singularity version).
2. Run `./apply-templates.sh` to regenerate the `<version>/Dockerfile` files, and commit the result.

The build workflow reads `versions.json` to decide what to build, and tags each image with its full version and `major.minor`. The newest version of each major also gets the major tag, and the newest overall gets `edge`. Run `./generate-matrix.sh` to preview the tags.

[singularity]: https://www.singularityviewer.org
[selkies]: https://github.com/linuxserver/docker-baseimage-selkies

