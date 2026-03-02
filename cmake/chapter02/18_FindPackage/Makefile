.PHONY: prepare clean build install configure
prepare: clean
	make clean && \
	make configure && \
	make build && \
	make install && \
	make run

configure:
	@echo "\033[32mConfiguring the project...\033[0m"
	cmake -S . -B build

build:
	@echo "\033[32mBuilding the project...\033[0m"
	@cmake --build build -j4

install:
	@echo "\033[32mInstalling the project...\033[0m"
	@cmake --install build --prefix dist

run: 
	@echo "\033[32mRunning the application...\033[0m"
	@./dist/bin/app
clean:
	@rm -rf build dist
