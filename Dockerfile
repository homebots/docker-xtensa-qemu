FROM homebotz/debian-dev:latest

RUN apt-get update
RUN git clone git://git.qemu.org/qemu.git /home/debian/qemu
RUN git clone https://github.com/skvadrik/re2c.git /home/debian/re2c && cd /home/debian/re2c && mkdir .build && cd .build && ../configure && make && make install & cd /home/debian/
RUN git clone https://github.com/ninja-build/ninja.git /home/debian/ninja && cd /home/debian/ninja && ./configure.py --bootstrap && ln -s /home/debian/ninja/ninja /usr/bin/ninja && cd /home/debian/

RUN mkdir /home/debian/qemu-xtensa
WORKDIR /home/debian/qemu-xtensa

RUN ../qemu/configure --prefix=`pwd`/root --target-list=xtensa-softmmu,xtensaeb-softmmu
RUN make install

ENV PATH=/home/debian/qemu-xtensa/root/bin:$PATH
