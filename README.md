### OneDrive Client in Docker

---

#### Introduction

This is a useful tool to synchronize your data between OneDrive and any environment where Docker is running on. It uses [Ubuntu](https://hub.docker.com/_/ubuntu/) as base layer and [OneDrive Free Client]([OneDrive Free Client](https://github.com/skilion/onedrive)) on top of it.

#### Quick Start

```
docker pull kukki/docker-onedrive
docker run --name onedrive
  -v /path/to/onedrive:/onedrive
  -v /path/to/onedrive.conf:/usr/local/etc/onedrive.conf
  docker-onedrive
```

*Note:*

* Update `/path/to` to your actual path of onedrive root and onedrive.conf
* For reference of onedrive.conf settings, please see [this configuration](https://github.com/skilion/onedrive#configuration)

#### Credits

* [OneDrive Free Client](https://github.com/skilion/onedrive)