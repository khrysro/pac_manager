FROM khrysro/ubuntu-sshd
MAINTAINER KhrysRo "https://github.com/khrysro"


ENV PAC_URL=https://github.com/khrysro/pac_manager
ENV PAC_VER=pac-4.5.5.7
ENV PAC_DEB=pac-${PAC_VERSION}-all.deb


RUN curl -s ${PAC_URL}/raw/master/packages/${PAC_DEB} -o /tmp/

#ADD ${PAC_URL}/raw/master/packages/${PAC_DEB} /tmp/

RUN apt-get update
RUN apt-get install -y /tmp/${PAC_DEB}


EXPOSE  22
