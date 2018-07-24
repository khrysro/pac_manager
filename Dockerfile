FROM khrysro/ubuntu-sshd
MAINTAINER KhrysRo "https://github.com/khrysro/"

RUN apt-get update
ENV PAC_URL=https://github.com/khrysro/pac_manager/
ENV PAC_VER=pac-4.5.5.7
ENV PAC_DEB=pac-${PAC_VERSION}-all.deb
ADD ${PAC_URL}raw/master/packages/${PAC_DEB} /tmp/
RUN apt-get install -y /tmp/${PAC_DEB}


EXPOSE  22
