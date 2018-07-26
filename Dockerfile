FROM khrysro/ubuntu-sshd
MAINTAINER KhrysRo "https://github.com/khrysro"

ENV PAC_URL=https://raw.githubusercontent.com/khrysro/pac_manager

ENV PAC_VER=4.5.5.7
ENV PAC_DEB=pac-${PAC_VER}-all.deb

RUN cd /tmp \
&& apt-get update \
&& apt-get install -y curl apt-utils wget unzip openssh-server

#RUN mkdir /var/run/sshd
RUN echo 'root:root' |chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
#RUN mkdir /root/.ssh

RUN curl -s ${PAC_URL}/master/packages/${PAC_DEB} -o /tmp/${PAC_DEB}

RUN apt-get install -y  /tmp/${PAC_DEB}

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 22 

CMD    ["/usr/sbin/sshd", "-D"]
