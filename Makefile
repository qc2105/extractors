targets = \
  extract_mpeg_frames

all: $(targets)

MPG123_CFLAGS  := $(shell pkg-config --cflags libmpg123)
MPG123_LDFLAGS := $(shell pkg-config --libs   libmpg123)

# Oder of libs not that important here...
compile = $(CC) $(CPPFLAGS) $(CFLAGS) $(MPG123_CFLAGS)
linkflags = $(MPG123_LDFLAGS) $(LDFLAGS)

extract_mpeg_frames: extract_mpeg_frames.c
	$(compile) -o $@ $< $(linkflags)

clean:
	rm -vf $(targets)