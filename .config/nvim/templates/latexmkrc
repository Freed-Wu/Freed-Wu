$show_time = 1;
$dependents_phony = 1;
$do_cd = 1;
$bibtex_use = 1.5;

$pdf_mode = 5;
$pdflatex = 'pdflatex -shell-escape -file-line-error -synctex=1 %O %S';
$xelatex = 'xelatex -shell-escape -8bit -file-line-error -no-pdf -synctex=1 %O %S';
$lualatex = 'lualatex -shell-escape -file-line-error -synctex=1 %O %S';

add_cus_dep('nlo', 'nls', 0, 'nlo2nls');
push @generated_exts, 'nlo', 'nls';
sub nlo2nls{
	return system("makeindex -s nomencl.ist -o '$_[0].nls' '$_[0].nlo'");
}

# latexmk -pvc- && latexmk -g
add_cus_dep('pytxcode', 'tex', 0, 'pythontex');
push @generated_exts, 'pytxcode';
sub pythontex{
	return system("pythontex '$_[0]'");
}

# ex: filetype=perl
