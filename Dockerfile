FROM debian

WORKDIR 2048

RUN apt-get -y update \ 
    && apt-get -y install \
       gcc wget \
    && wget https://raw.githubusercontent.com/mevdschee/2048.c/master/2048.c \
    && gcc -o 2048 2048.c \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV TERM=xterm-256color
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

ENTRYPOINT ["./2048"]
