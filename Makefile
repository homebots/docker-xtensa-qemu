TARGET 				= /target/firmware.out


ifeq ("$(DEBUG)","1")
	DEBUG_FLAGS = -s -S
else
	DEBUG_FLAGS = ''
endif

all:
	qemu-system-xtensa -M esp8266 -nographic -serial stdio -monitor none $(DEBUG_FLAGS) -kernel $(TARGET)