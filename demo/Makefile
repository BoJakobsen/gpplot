# find all files ending with .m, excluding startup.m
MFIGS=$(filter-out startup.m, $(wildcard *.m))

# List of all tex files
GPTEX=$(patsubst %.m, %.tex, $(MFIGS))

# list of all h5 files
GPh5=$(patsubst %.m, %.h5, $(MFIGS))

# list of all gp files
GPgp=$(patsubst %.m, %.gp, $(MFIGS))

# Generate gp and h5 files from m files
# including dependency of a startup file
%.gp : %.m startup.m
	matlab -nojvm -nodesktop -nosplash -r "run('$<');exit"

# General roule for generating the figures from gp and h5 files
# including dependency of a default.inc file
%.tex: %.gp default.inc
	gnuplot $<

# texfigs depends on texfigs.tex and all figures in tex formatl
texfigs_crop.pdf: texfigs.tex $(GPTEX) $(GPgp) $(GPh5)
	pdflatex texfigs
	pdfcrop texfigs.pdf texfigs_crop.pdf

# this will just run every time, expanding the pdf to individual files
files: texfigs.pdf
	pdfseparate texfigs_crop.pdf fig-%d.pdf

clean: 
	-rm texfigs.aux
	-rm texfigs.log
	-rm *.pdf
	-rm $(GPh5)
	-rm $(GPTEX)
	-rm $(GPgp)



