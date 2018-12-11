FROM centos:7

# 用jdk1.8版本，前提是在Dockerfile的同一目录下有jdk的jar包
ADD jdk-8u191-linux-x64.tar.gz /opt/
ADD aspectjweaver-1.7.3.jar /opt/
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 #配置显示中文 
#设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone

ENV JAVA_HOME /opt/jdk1.8.0_191
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH $PATH:$JAVA_HOME/bin

ENV LANG zh_CN.UTF-8
