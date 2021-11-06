# QEMU build for esp8266 firmware

## Usage

Mount the output file of your compiler into this docker image and let it run with the QEMU emulator.

```bash
docker run --rm -it -v $(pwd)/build/firmware.out:/target/firmware.out homebotz/xtensa-qemu
```
