PLATFORMS = linux-amd64 linux-386 linux-arm linux-arm64 linux-ppc64le linux-s390x darwin-amd64 darwin-arm64 windows-amd64 windows-arm64

.PHONY: all build build-all clean

all: build

build:
	./scripts/build.sh

build-all:
	@for platform in $(PLATFORMS); do \
		echo "Building for $$platform..."; \
		./scripts/build.sh $$platform; \
	done

clean:
	rm -rf bin/*
