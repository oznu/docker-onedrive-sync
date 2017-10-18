# Docker OneDrive Sync

This Docker image powered by [skilion/onedrive](https://github.com/skilion/onedrive) allows you to sync a local volume with OneDrive.

### Features:

* State caching
* File monitoring
* Resumable uploads
* Supports OneDrive for Business and OneDrive Personal

## Setup - First Run



When first launching the container you will need to authenticate with your Microsoft account. The procedure requires a web browser. You will be asked to open a specific link where you will have to login into your Microsoft Account and give the application the permission to access your files. After giving the permission, you will be redirected to a blank page. Copy the URI of the blank page into the application.

To allow you to copy the URI back into the docker container you need to launch it in interactive mode, this can be done using the `-it` flag.

```shell
docker run -it -v </path/to/config>:/config -v </path/to/documents>:/documents oznu/onedrive
```

Once authenticated you can stop the sync process and restart the container in non-interactive mode.

[![asciicast](https://asciinema.org/a/jUXikuR4MHHHTgLBypWDKB6Vu.png)](https://asciinema.org/a/jUXikuR4MHHHTgLBypWDKB6Vu)

## Usage

```shell
docker run \
  -e PUID=<UID> -e PGID=<GID> \
  -e TZ=<timezone> \
  -v </path/to/config>:/config \
  -v </path/to/documents>:/documents \
  oznu/onedrive
```

## Parameters

The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side.

* `-v /config` - This is where the OneDrive Client will store it's config. See [skilion/onedrive#configuration](https://github.com/skilion/onedrive#configuration)
* `-v /documents` - This is the folder that will be synced with OneDrive
* `-e TZ` - for [timezone information](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) e.g. `-e TZ=Europe/London`
* `-e PGID` - for GroupID - This should match the GID of the user who owns the local files
* `-e PUID` - for UserID - This should match the UID of the user who owns the local files
* `-e DEBUG=1` - to enable verbose logging set `DEBUG=1`

## Docker Compose

If you prefer to use [Docker Compose](https://docs.docker.com/compose/):

```yml
version: '2'
services:
  onedrive:
    image: oznu/onedrive
    restart: always
    environment:
      - TZ=Australia/Sydney
      - PGID=911
      - PUID=911
    volumes:
      - ./config:/config
      - /home/oznu:/documents
```

To authenticate with your Microsoft account for the first time run (this will start the container in interactive mode):

```
docker-compose run onedrive
```

You can then start the container in non-interactive and run it as a background process:

```
docker-compose up -d
```
