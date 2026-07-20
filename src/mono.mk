all-local: run

program.exe: program.cs
	$(MCS) program.cs

run: program.exe libsum.la
	LD_LIBRARY_PATH=.libs:$$LD_LIBRARY_PATH $(MONO) program.exe
