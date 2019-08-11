FROM centos:7.6.1810

LABEL maintainer="packaging@loudml.io"

RUN adduser loudml && \
	yum install -y epel-release && \
	yum install -y https://centos7.iuscommunity.org/ius-release.rpm

RUN yum install -y rpmdevtools && \
	yum install -y gcc && \
	yum install -y make git && \
	yum install -y python36u python36u-devel python36u-pip

RUN python3.6 -m venv /opt/loudml && \
	/opt/loudml/bin/pip install -U pip && \
	/opt/loudml/bin/pip --version && \
	chown -R loudml /opt/loudml
