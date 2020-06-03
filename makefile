main:	main.cpp
	clang++ -O0 -o main main.cpp  -fprofile-instr-generate -fcoverage-mapping

clean:
	rm -rf main{,.profdata,.dat,.json,.html} one.profraw two.profraw

run: main
	LLVM_PROFILE_FILE=one.profraw ./main 1
	LLVM_PROFILE_FILE=two.profraw ./main 1 2

coverage: run
	llvm-profdata merge --sparse one.profraw two.profraw -o main.profdata
	llvm-cov show main -instr-profile=main.profdata -Xdemangler=c++filt -region-coverage-lt=100 > main.dat
	llvm-cov export main -instr-profile=main.profdata -Xdemangler=c++filt -region-coverage-lt=100 > main.json
	llvm-cov show main -instr-profile=main.profdata -Xdemangler=c++filt -region-coverage-lt=100 -format=html > main.html
