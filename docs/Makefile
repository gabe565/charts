prepare:
	./hack/prepare-docs.sh

watch: prepare
	mdbook watch --open

build: prepare
	mdbook build
	./hack/strip-link-index.sh
