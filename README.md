# yapi docker
 
目前最简易的`docker`布署`yapi`方式

## 前置条件
   需安装`docker`和`docker-compose` (废话)

## 使用说明

- 修改`Dockerfile` 可以指定目标版本
- 修改`config.json`和`docker-compose.yaml` 指定`mongo`的账号和密码,还有`yapi`的初始账号
- 执行`build_image.sh` 打包镜像  
      NOTE: 打包境像会将`config.json`拷贝进镜像,路径为`/yapi/config.json`
- 执行`docker-compose up -d mongo` 启动`mongo` 
- 执行 `install.sh` 初始化`mongo`的yapi数据
- 执行`docker-compose up -d yapi` 即启动完成  
      NOTE: 默认账户为`config.json`里设置`adminAccount`的账户,  
            默认密码为 `ymfe.org` 登录系统(默认密码可在个人中心修改)