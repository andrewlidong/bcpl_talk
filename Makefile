PREFIX=${HOME}/.local

all: dist/slides/slides

ifeq ($(shell uname -s),Darwin)
LIBEXT=.dylib
else
LIBEXT=.so
endif

dist/slides/slides: btui/Python/libbtui$(LIBEXT) slides.py
	pyinstaller -y --onedir --add-binary btui/Python/libbtui$(LIBEXT):. slides.py

btui/Python/libbtui$(LIBEXT):
	make -C btui python

install: dist/slides/slides
	install -d $(PREFIX)/share/slides/
	cp -r dist/slides/* $(PREFIX)/share/slides/
	ln -sf $(PREFIX)/share/slides/slides ~/.local/bin/slides
