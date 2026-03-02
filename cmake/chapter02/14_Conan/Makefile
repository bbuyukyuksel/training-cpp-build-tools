dependency:
	mkdir -p dependency && cd dependency \
	&& cmake -S.. -B ../build --graphviz=dependencies.dot \
		&& dot -Tpng dependencies.dot -o dependencies.png

prepare:
	rm -rf build
	mkdir build

conan_r:
	rm -rf build
	conan install . --build=missing -s build_type=Release --lockfile-out=conan.lock \
	 && cmake -S . -B build -DCMAKE_BUILD_TYPE=Release \
	 && cmake --build build
