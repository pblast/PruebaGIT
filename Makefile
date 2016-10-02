
#*******************************************************************************
#    OPCIONES DE PROYECTO
#*******************************************************************************
# SALIDA
TARGET=PruebaGIT



#*******************************************************************************
#    GESTIÓN DE DIRECTORIOS / OBJETOS
#*******************************************************************************
# DIRECTORIOS
SRCDIR=src
INCDIR=inc
OBJDIR=obj

#ARCHIVOS
SRCS:=$(wildcard $(SRCDIR)/*.c)
OBJS:=$(SRCS:$(SRCDIR)/%.c=$(OBJDIR)/%.o)



#*******************************************************************************
#    OPCIONES DE COMPILACION
#*******************************************************************************
# COMPILADOR
CC=gcc

# FLAGS DE COMPILACIÓN
CFLAGS=-Wall
CFLAGS+= -std=c90
CFLAGS+=-I./$(INCDIR)


#*******************************************************************************
#    OPCIONES DE LINKADO
#*******************************************************************************
# LINKER
LINKER   = gcc

# FLAGS DE LINKADO
LFLAGS   = -Wall
LGLAGS+= -I./$(INCDIR)
LFLAGS+= -lm
POSTLFLAGS= -lcurl


#*******************************************************************************
#   REGLAS DE CONTROL DE VERSIÓN
#*******************************************************************************

# Se lee la versión actual del programa
MAJORV=$(shell grep -w -m 1 "MAJOR_VER" inc/main.h|grep -o '[0-9]\+')
MINORV=$(shell grep -w -m 1 "MINOR_VER" inc/main.h|grep -o '[0-9]\+')
PATCHV=$(shell grep -w -m 1 "PATCH_VER" inc/main.h|grep -o '[0-9]\+')
BUILDV=$(shell grep -w -m 1 "BUILD_VER" inc/main.h|grep -o '[0-9]\+')


majorver:
	$(eval sum=$(shell echo $$(( $(MAJORV) +1 ))))
	$(shell sed -i -E "s/(#define MAJOR_VER )[0-9]*/\1${sum}/g" inc/main.h)
	$(shell sed -i -E "s/(#define MINOR_VER )[0-9]*/\10/g" inc/main.h)
	$(shell sed -i -E "s/(#define PATCH_VER )[0-9]*/\10/g" inc/main.h)
	$(shell sed -i -E "s/(#define BUILD_VER )[0-9]*/\10/g" inc/main.h)


minorver:
	$(eval sum=$(shell echo $$(( $(MINORV) +1 ))))
	$(shell sed -i -E "s/(#define MINOR_VER )[0-9]*/\1${sum}/g" inc/main.h)
	$(shell sed -i -E "s/(#define PATCH_VER )[0-9]*/\10/g" inc/main.h)
	$(shell sed -i -E "s/(#define BUILD_VER )[0-9]*/\10/g" inc/main.h)


patchver:
	$(eval sum=$(shell echo $$(( $(PATCHV) +1 ))))
	$(shell sed -i -E "s/(#define PATCH_VER )[0-9]*/\1${sum}/g" inc/main.h)
	$(shell sed -i -E "s/(#define BUILD_VER )[0-9]*/\10/g" inc/main.h)


buildver:
	$(eval sum=$(shell echo $$(( $(BUILDV) +1 ))))
	$(shell sed -i -E "s/(#define BUILD_VER )[0-9]*/\1${sum}/g" inc/main.h)


#*******************************************************************************
#    REGLAS DE COMPILACION
#*******************************************************************************

all: build buildver

major: build gitcommit majorver
minor: build minorver
patch: build patchver



gitcommit:
	$(eval COMMITMSG ?= $(shell bash -c 'read -p "Commit MSG: " msg; echo $$msg'))
	@git add .
	@git commit -m "$(COMMITMSG)"
	echo Se acabo esto

build: $(TARGET)

$(TARGET):$(OBJS)
	@$(LINKER)  $(LFLAGS) $(OBJS) -o $@ $(POSTLFLAGS)
	@echo "Versión: ${MAJORV}.${MINORV}.${PATCHV}b${BUILDV}"

$(OBJS): $(OBJDIR)/%.o : $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean :
	@rm -rf $(OBJDIR)/*.o
	@echo "Clean done!!"
