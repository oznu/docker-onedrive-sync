## OneDrive Client in Docker

### Introduction

This is a useful tool to synchronize your data between OneDrive (personal account only) and any environment that supports Docker. It uses [Ubuntu](https://hub.docker.com/_/ubuntu/) as base layer and [OneDrive Free Client](https://github.com/skilion/onedrive) on top of it.

### Quick Start

#### Step 1

```shell
docker pull kukki/docker-onedrive
```

#### Step 2

```shell
docker run -it --restart on-failure --name onedrive
  -v /path/to/onedrive:/onedrive
  docker-onedrive
```

#### Step 3

* Copy the URL in the prompt and visit it on your browser.

* It authenticates and authorizes your Microsoft account

* After you accept the application, a response URI is updated in the browser.

* Copy the URI to the prompt and hit `Enter`

#### Step 4

You can keep the docker container running in the foreground

-- or --

You can hit `CTRL-C` to stop it and then re-start the container

```shell
docker start docker-onedrive
```


*Note:*

* Update `/path/to` to your actual path of onedrive root and onedrive.conf
* For reference of onedrive.conf settings, please see [this configuration](https://github.com/skilion/onedrive#configuration)
* `--restart on-failure` is to set auto-restart when the sync is timeout due to the connection.

### Use you own Microsoft App Client

#### Step 1 - Register Your App

* Visit [Official Guide](https://dev.onedrive.com/app-registration.htm) for reference


* Visit [Microsoft Application Registration Portal](https://apps.dev.microsoft.com/?referrer=https%3A%2F%2Fdev.onedrive.com%2Fapp-registration.htm) to add an app 

#### Step 2 - Retrieve Your Client ID

* Choose `Mobile application` in Platforms
* The client ID is then available

#### Step 3 - Apply the Client ID

* Create file onedrive.conf in your convenient place with the following content:

```
client_id = "";
sync_dir = "/onedrive"
skip_file = ".*|~*"
skip_dir = ".*"
```

* Copy and paste your client ID to `clien_id` parameter
* (Optional) You can also update `skip_file` and `skip_dir` parameters

#### Step 4 - Re-create Docker Containers

```
docker rm docker-onedrive
docker run -it --restart on-failure --name onedrive
  -v /path/to/onedrive:/onedrive
  -v /path/to/onedrive.conf:/usr/local/etc/onedrive.conf
  docker-onedrive
```

* Follow [step 3](#step_3) and [step 4](#step_4) in Quick Start

### Credits

* [OneDrive Free Client](https://github.com/skilion/onedrive)