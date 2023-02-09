OCAMLBUILD = ocamlbuild -tag safe_string -pkg unix -I src

all: Makefile.coq
	+$(MAKE) -f Makefile.coq
	$(OCAMLBUILD) benchmark.native

clean: Makefile.coq
	+$(MAKE) -f Makefile.coq cleanall
	rm -f Makefile.coq Makefile.coq.conf
	$(OCAMLBUILD) -clean

Makefile.coq: _CoqProject
	$(COQBIN)coq_makefile -f _CoqProject -o Makefile.coq

_CoqProject Makefile: ;

%: Makefile.coq
	+$(MAKE) -f Makefile.coq $@

.PHONY: all clean
