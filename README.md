# Docker-Revive-Adserver
## 介绍
该项目帮助您通过docker进行快速部署revive-adserver

## Requirements
- **docker** (https://docs.docker.com/engine/installation/linux/debian/)  
- **docker-compose** (https://docs.docker.com/compose/install/)  

## 如何使用
**1:** Clone该项目，并且进入目录
`git clone https://github.com/JimmyBryant/docker-revive-adserver.git`  
`cd docker-revive-adserver` 	

**2:** 执行下面命令以启动nginx和mysql容器
`docker-compose up -d`

**3:** 获取Mysql容器的IP地址
`docker inspect --format '{{ .NetworkSettings.IPAddress }}' docker-revive-adserver_db_1`

**4:** 访问http://IP[:端口]  初始化Revive Adserver，例如我的服务器：http://217.118.67.176:8000

**5:** Accept the terms. Now should display the database connection setup

**6:** Mysql容器默认创建了用户revive，初始密码123456,新建了空的数据库revive5
- **Database Name:revive5** 
- **username:** revive  
- **password:** 123456  
- **hostname:** (填写Mysql容器的IP)  

**7:** 开始使用revive-adserver

## memcached缓存
1. 首先需要查清楚memcached容器的IP地址，然后去Plugins选项下设置Banner Delivery Cache Store Plugin的memcached Host，例如172.18.0.4:11211
2. 再去Configuration选项下的Banner Delivery Setting设置	Banner Delivery Cache Store Type为memcached即可

