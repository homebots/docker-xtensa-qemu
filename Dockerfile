FROM homebotz/debian-dev:latest

RUN mkdir /home/debian/qemu-xtensa
WORKDIR /home/debian/qemu-xtensa
RUN apt-get update
RUN git clone https://github.com/skvadrik/re2c.git /home/debian/re2c && cd /home/debian/re2c && mkdir .build && cd .build && ../configure && make && make install & cd /home/debian/
RUN git clone https://github.com/ninja-build/ninja.git /home/debian/ninja && cd /home/debian/ninja && ./configure.py --bootstrap && ln -s /home/debian/ninja/ninja /usr/bin/ninja && cd /home/debian/
RUN git clone --recursive https://github.com/OSLL/qemu-xtensa.git -b xtensa-esp8266 /home/debian/qemu
ADD qemu.patch /home/debian/qemu/
RUN (cd /home/debian/qemu && git apply qemu.patch)
RUN ../qemu/configure --prefix=`pwd`/root --target-list=xtensa-softmmu,xtensaeb-softmmu --disable-werror
RUN make && make install
ADD Makefile /home/debian
WORKDIR /home/debian

ENV PATH=/home/debian/qemu-xtensa/root/bin:$PATH
CMD [ "make", "run" ]