all: lec1.pdf lec2.pdf lec3.pdf lec4.pdf lec5.pdf

lec5.pdf: sigmoid.pdf

sigmoid.pdf: Makefile
	echo 'set term pdf size 3in, 2in; set output "$@"; set nokey; plot(1/(1+exp(-x))) with lines lw 4;' | gnuplot

%.pdf: %.tex
	pdflatex $<

clean:
	rm -f lec[12345].{aux,dvi,log,nav,out,pdf,snm,toc} sigmoid.pdf
