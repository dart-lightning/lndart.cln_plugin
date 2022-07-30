CC=dart
FMT=format
ARGS="--help"
PROBLEM=
NAME=cln_plugin

default: fmt build

dep:
	$(CC) pub get

fmt:
	$(CC) $(FMT) .
	$(CC) analyze .

examples:
	$(CC) compile exe example/cln_plugin_example.dart -o cln_dart
	$(CC) compile exe example/cln_plugin_class_example.dart -o cln_class_dart

gen:
	$(CC) run build_runner build

clean:
	rm lib/src/**/*.g.dart

check:
	$(CC) test

build:
	$(CC) compile exe bin/cln_plugin.dart -o $(NAME)