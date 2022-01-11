.PHONY: build clean deps bench

build:
	dune build @install

clean:
	dune clean

deps:
	opam install benchmark

bench:
	dune build @all
	dune exec ./bench/bench.exe all
