# FROM python:3.7-buster
FROM registry.cn-hangzhou.aliyuncs.com/dzf/python:3.7-buster
RUN apt-get -qq update \
    && apt-get -yqq install --no-install-recommends libgl1-mesa-glx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY .ssh/* /root/.ssh/
COPY docker-entrypoint.sh /usr/local/bin

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 8089
