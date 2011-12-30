all: lec1.pdf lec2.pdf lec3.pdf lec4.pdf lec5.pdf lec6.pdf lec7.pdf lec8.pdf lec9.pdf lecA.pdf lecB.pdf

lec5.pdf: sigmoid.pdf graph.pdf

sigmoid.pdf: Makefile
	echo 'set term pdf size 3in, 2in; set output "$@"; set nokey; plot(1/(1+exp(-x))) with lines lw 4;' | gnuplot

graph.pdf: graph.neato
	neato -Tpdf -o "$@" "$^"

%.pdf: %.tex
	pdflatex $<

clean:
	rm -f lec[123456789AB].{aux,dvi,log,nav,out,pdf,snm,toc} sigmoid.pdf
