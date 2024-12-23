PLATFORMS=linux-amd64 linux-386 linux-arm linux-arm64 linux-ppc64le linux-s390x darwin-amd64 darwin-arm64 windows-amd64 windows-arm64

.PHONY: all build build-all clean

all: build

build-all:
	@for platform in $(PLATFORMS); do \
		$(MAKE) build-$${platform}; \
	done

build-%:
	chmod +x ./scripts/build.sh
	GO_BUILD_FLAGS="${GO_BUILD_FLAGS} -v -mod=readonly" ./scripts/build.sh "$*"

clean:
	rm -rf bin/*