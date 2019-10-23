# Docker-Revive-Adserver
## 介绍
该项目帮助您通过docker进行快速部署revive-adserver

## 部署环境
- **docker** (https://docs.docker.com/engine/installation/linux/debian/)  
- **docker-compose** (https://docs.docker.com/compose/install/)  

## 如何使用
**1ª Step:** Clone该项目，并且进入目录
`git clone https://github.com/JimmyBryant/docker-revive-adserver.git`  
`cd docker-revive-adserver` 	

**2ª Step:** 执行下面命令以启动nginx和mysql容器
`docker-compose up -d`

**3ª Step:** 获取Mysql容器的IP地址
`docker inspect --format '{{ .NetworkSettings.IPAddress }}' docker-revive-adserver_db_1`

**4ª Step:** 通过服务器http://IP[:端口]访问revive adserver进行安装，例如我的服务器：http://217.118.67.176:8000

**5ª Step:** Accept the terms. Now should display the database connection setup

**6ª Step:** Mysql容器默认创建了用户revive，初始密码123456,新建了空的数据库revive5
- **Database Name:revive5** 
- **username:** revive  
- **password:** 123456  
- **hostname:** (It is the IP that you get on **3ª Step**)  

**7ª Step:** 开始使用revive-adserver
