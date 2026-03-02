dependency:
	mkdir -p dependency && cd dependency \
	&& cmake -S.. -B ../build --graphviz=dependencies.dot \
		&& dot -Tpng dependencies.dot -o dependencies.png

prepare:
	rm -rf build
	mkdir build