# Git SubModules

### Adding submodule

```sh
$ git submodule add https://github.com/nlohmann/json external/json
```

### Visualizing Dependencies

```sh
$ apt install graphviz
$ cmake -Bbuild --graphviz=test.dot
$ dot -Tpng test.dot -o test.png
```
