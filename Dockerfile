FROM khrysro/ubuntu-sshd
MAINTAINER KhrysRo "https://github.com/khrysro"


#ENV PAC_URL=https://github.com/khrysro/pac_manager
ENV PAC_URL=https://raw.githubusercontent.com/khrysro/pac_manager

ENV PAC_VER=4.5.5.7
ENV PAC_DEB=pac-${PAC_VER}-all.deb

RUN cd /tmp \
&& apt-get update \
&& apt-get install -y curl apt-utils wget unzip


RUN curl -s ${PAC_URL}/master/packages/${PAC_DEB} -o /tmp/${PAC_DEB}
#ADD ${PAC_URL}/master/packages/${PAC_DEB} /tmp/


#RUN  dpkg -i /tmp/${PAC_DEB}

#RUN apt-get install -y -f
RUN apt-get install -y  /tmp/${PAC_DEB}
#RUN  dpkg -i /tmp/${PAC_DEB}

EXPOSE  22
