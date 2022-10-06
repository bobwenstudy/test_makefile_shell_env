OUTPUT_DIR = output/obj
OBJECTS = $(OUTPUT_DIR)/main.o

MKD := mkdir
RM := del /q /s
FIXPATH = $(subst /,\,$1)

$(warning SHELL, $(SHELL), $(ComSpec))

ifeq ($(TEST_OS),1)
	MKD := mkdir -p
	RM := rm -rf
	FIXPATH = $1
endif

ifeq ($(TEST_OS),2)
	ifdef ComSpec
		WINCMD:=$(ComSpec)
	endif
	ifdef COMSPEC
		WINCMD:=$(COMSPEC)
	endif

	SHELL:=$(WINCMD)
	MKD := mkdir -p
	RM := rm -rf
	FIXPATH = $1
endif


ifeq ($(TEST_OS),3)
	ifdef ComSpec
		WINCMD:=$(ComSpec)
	endif
	ifdef COMSPEC
		WINCMD:=$(COMSPEC)
	endif

	SHELL:=$(WINCMD)
	MKD := mkdir
	RM := del /q /s
	FIXPATH = $(subst /,\,$1)
endif

ifeq ($(TEST_OS),4)
	ifdef ComSpec
		WINCMD:=$(ComSpec)
	endif
	ifdef COMSPEC
		WINCMD:=$(COMSPEC)
	endif

	SHELL:=$(WINCMD)
	MKD := "mkdir" -p
	RM := rm -rf
	FIXPATH = $1
endif

ifeq ($(TEST_OS),5)
	ifdef ComSpec
		WINCMD:=$(ComSpec)
	endif
	ifdef COMSPEC
		WINCMD:=$(COMSPEC)
	endif

	SHELL:=$(WINCMD)
	MKD := mkdir.exe -p
	RM := rm -rf
	FIXPATH = $1
endif

all: $(OBJECTS)
	gcc $^ -o $(OUTPUT_DIR)/main
$(OBJECTS): $(OUTPUT_DIR)/%.o: %.c
	$(MKD) $(call FIXPATH, $(@D))
	gcc -c -o $@ $<
clean:
	$(RM) $(call FIXPATH, $(OUTPUT_DIR))