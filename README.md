# Docker OneDrive Sync

This repository is forked from https://bitbucket.org/jkoo/docker-onedrive

## Introduction

This is a useful tool to synchronize your data between OneDrive (personal account only) and any environment that supports Docker. It uses [Ubuntu](https://hub.docker.com/_/ubuntu/) as base layer and [OneDrive Free Client](https://github.com/skilion/onedrive).



## Quick Start

#### Step 1

```shell
docker pull oznu/onedrive
```

#### Step 2

```shell
docker run -it --restart on-failure --name docker-onedrive
  -v /path/to/onedrive:/onedrive
  oznu/onedrive
```

*Note:*

- Update `/path/to` to your actual path of onedrive root and onedrive.conf.
- `--restart on-failure` is to set auto-restart when the sync is timeout due to the connection.

#### Step 3

* Copy the URL in the prompt and visit it on your browser.

* It authenticates and authorizes your Microsoft account.

* After you accept the application, a response URI is updated in the browser.

* Copy the URI to the prompt and hit `Enter`

#### Step 4

You can keep the docker container running in the foreground.

-- or --

You can hit `CTRL-C` to stop it and then **re-start** the container.

```shell
docker start docker-onedrive
```



## Advanced Use

#### Step 1 - Register Your App

* Visit [Official Guide](https://dev.onedrive.com/app-registration.htm) for reference.


* Visit [Microsoft Application Registration Portal](https://apps.dev.microsoft.com/?referrer=https%3A%2F%2Fdev.onedrive.com%2Fapp-registration.htm) to add an app.

#### Step 2 - Retrieve Your Client ID

* Choose `Mobile application` in Platforms.
* The client ID is then available.

#### Step 3 - Apply the Client ID

* Create file `onedrive.conf` in your convenient place with the following content:

```
client_id = "";
sync_dir = "/onedrive"
skip_file = ".*|~*"
skip_dir = ".*"
```

* Copy and paste your client ID to `client_id` parameter.
* For reference of `onedrive.conf` settings, please see [this configuration](https://github.com/skilion/onedrive#configuration).

#### Step 4 - Re-create Docker Containers

```
docker rm docker-onedrive
docker run -it --restart on-failure --name docker_onedrive
  -v /path/to/onedrive:/onedrive
  -v /path/to/onedrive.conf:/usr/local/etc/onedrive.conf
  oznu/onedrive
```

* Follow `step 3` and `step 4` in `Quick Start`.



## Reference

* [Jimmy Koo/docker-onedrive](https://bitbucket.org/jkoo/docker-onedrive)
* [OneDrive Free Client](https://github.com/skilion/onedrive)



## License

* [GNU General Public License v3](http://www.gnu.org/licenses/gpl-3.0.en.html)
