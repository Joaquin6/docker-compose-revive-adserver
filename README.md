# Docker-Revive-Adserver

## Introduction

The purpose of this small project is to quickly deploy revive-adserver-5.0.0 through docker containers

## Requirements

- **docker** (https://docs.docker.com/engine/installation/linux/debian/)
- **docker-compose** (https://docs.docker.com/compose/install/)

## how to use

**1:** Clone the project and enter the directory

```sh
git clone https://github.com/Joaquin6/docker-revive-adserver.git
```

```sh
cd docker-revive-adserver
```

**2:** Execute the following commands to start nginx and mysql containers

```sh
docker-compose up -d
```

**3:** Get the IP address of the Mysql container

```sh
docker inspect --format '{[ NetworkSettings.IPAddress ]}' docker-compose-revive-adserver_db_1
```

**4:** Visit `http://[:ip][:port]` to initialize Revive Adserver, such as my server: [local-revive-server](http://adserver.revive.io:8000/)

[Revice Server Initial Setup](./assets/revive-server-initial-setup.png)

**5:** Accept the terms. Now should display the database connection setup

**6:** Mysql container creates the user revive by default, the initial password is `password`, and an empty database revive_adserver_530 is created.

- **DB Name:** revive_adserver_530
- **username:** admin
- **password:** password
- **hostname:** (Fill in the IP of the Mysql container) - `172.21.0.2`

[Setup Complete](./assets/revive-server-initial-setup-complete.png)

**7:** Click `Continue` and Start using revive-adserver

## memcached cache

1. First, you need to find out the IP address of the memcached container, and then go to the Plugins option to set the memcached Host of the Banner Delivery Cache Store Plugin, for example, 172.18.0.4:11211
2. Go to Banner Delivery Setting under Configuration option and set Banner Delivery Cache Store Type to memcached
