<h1 align="center">Singularity</h1>

<p align="center">
  <img src="https://f.subo.dev/i/o/sd1.webp" alt="Screenshot from inside the Singularity Metaverse client contained within the Chromium web browser, showing a woman with a floating nametag 'Balthazar Swindon' staring out into empty landmass" />
</p>

Run **[Singularity Viewer][singularity]** in a web-accessible Docker container, similar to **Second Life Zero**. Built upon the [Selkies Linuxserver base image][selkies].

> [!WARNING]  
> This is not even remotely ready. Use at your own risk.

## Quickstart

> [!IMPORTANT]  
> This instruction gets you up and running, but comes with no security guardrails. **Use at your own risk**, and absolutely **do not use in a shared environment**.

To run the server, use the following command (or [see the Docker Compose file](/docker-compose.yml):

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

[singularity]: https://www.singularityviewer.org
[selkies]: https://github.com/linuxserver/docker-baseimage-selkies

