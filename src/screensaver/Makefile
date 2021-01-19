LDFLAGS = -bundle -framework Carbon -framework ScreenSaver -framework WebKit
CFLAGS = -Wall -Wextra

OUT_FILES =
OUT_FILES += out/MediaScreenSaver.saver/Contents/MacOS/MediaScreenSaver
OUT_FILES += out/MediaScreenSaver.saver/Contents/Info.plist

all: $(OUT_FILES)

out/MediaScreenSaver.saver/Contents/MacOS/MediaScreenSaver: MediaScreenSaverView.m
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $^ $(LDFLAGS) -o $@

out/MediaScreenSaver.saver/Contents/Info.plist:
	mkdir -p $(dir $@)
	cp Info.plist $@

clean:
	$(RM) $(OUT_FILES)
