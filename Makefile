targets = \
  extract_mpeg_frames \
	bytes_of_file

all: $(targets)

MPG123_CFLAGS  := $(shell pkg-config --cflags libmpg123)
MPG123_LDFLAGS := $(shell pkg-config --libs   libmpg123)

# Oder of libs not that important here...
compile = $(CC) $(CPPFLAGS) $(CFLAGS) $(MPG123_CFLAGS)
linkflags = $(MPG123_LDFLAGS) $(LDFLAGS)

extract_mpeg_frames: extract_mpeg_frames.c
	$(compile) -o $@ $< $(linkflags)

bytes_of_file: bytes_of_file.c
	gcc -Wall -o $@ $< $(CFLAGS)

clean:
	rm -vf $(targets)