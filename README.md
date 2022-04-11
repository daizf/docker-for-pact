# docker-for-pact
## 需求：
- 指定git仓库下载代码
- 自动初始化环境（Python，依赖可通过PIP安装）
## Base Image
需要python3的环境，因此从官网 https://hub.docker.com/_/python 选择tag为：3.7-buster的版本.

不同镜像版本区别参考：https://blog.csdn.net/dcr782195101/article/details/122330234

docker hub官网下载太慢，已经将base image 推送到aliyun，下载方式为：
docker pull registry.cn-hangzhou.aliyuncs.com/dzf/python:3.7-buster

## 生成证书
github目前仅支持ssh方式，所以在clone代码的时候需要通过证书来认证。
```
ssh-keygen -t rsa -C "zhfai@163.com"
```
1. 需要将证书打包在docker image中
2. 需要将public key注册在github中：https://github.com/settings/keys
3. known_hosts 记录github.com的公钥，这样建立连接时候就不需要再进行确认

## 镜像构建
启动命令在：docker-entrypoint.sh，可以根据需要修改。
```
docker build -t python:3.7-buster-git .
```
## 测试
通过环境变量`BRANCH`和`REPO`来指定分支和代码仓库地址
```
docker run -e BRANCH=main -e REPO=git@github.com:xiyejin/pact-demo.git -p9090:8089 -d python:3.7-buster-git
```
对于支持https/http的仓库可以将账号密码一起传递
```
docker run -e BRANCH=main -e REPO=user:password@https://github.com/daizf/docker-for-pact.git -p9090:8089 -d python:3.7-buster-git
```