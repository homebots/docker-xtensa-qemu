TARGET = /home/debian/flash.bin
DEBUG_FLAGS =

ifeq ("$(VERBOSE)","1")
	DEBUG_FLAGS = -S -s
else

.PHONY run

run:
	@echo "Running $(TARGET)"
	qemu-system-xtensa -M esp8266 -nographic -serial stdio -monitor none $(DEBUG_FLAGS) -kernel $(TARGET)