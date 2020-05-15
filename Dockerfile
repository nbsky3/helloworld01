# 构建一个基于ubuntu 的docker 定制镜像
# 基础镜像
FROM ubuntu

# 镜像作者
MAINTAINER xxxx xxxx@163.com

# 增加国内源
#COPY sources.list /etc/apt/
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

# 执行命令
RUN apt-get update
RUN apt-get install gcc libc6-dev git lrzsz -y

#将go复制解压到容器中
#ADD go1.10.linux-amd64.tar.gz  /usr/local/

# 定制环境变量
ENV GOROOT=/usr/local/go                
ENV PATH=$PATH:/usr/local/go/bin   
ENV GOPATH=/root/go
ENV PATH=$GOPATH/bin/:$PATH

# 下载项目
#RUN go get github.com/nbsky3/helloworld01

# build
#RUN go build
