dependency:
	cmake -S. -B build --graphviz=test.dot \
		&& dot -Tpng test.dot -o test.png

prepare:
	rm -rf build
	mkdir build