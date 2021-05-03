BUILD_TEMP=build
BUILD_PKG=deployment.zip

all: $(BUILD_PKG) ## Build everything
dist: $(BUILD_PKG)  ## Build an distributable package
$(BUILD_PKG): 
	mkdir -p $(BUILD_TEMP)
	cp lambda-source/* $(BUILD_TEMP)
	cd $(BUILD_TEMP) && pip install -qt . -r requirements.txt && \
	  zip -qr ../$(BUILD_PKG) .

clean:
	rm -rf $(BUILD_TEMP) $(BUILD_PKG)

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

