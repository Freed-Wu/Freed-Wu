#!/usr/bin/env perl
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => '%PERLDIR%',
    LICENSE       => 'gpl_3',
    AUTHOR        => '%USER% <%MAIL%>',
    VERSION_FROM  => '%PERLFILE%.PL',
    ABSTRACT_FROM => '%PERLFILE%.pod',
    EXE_FILES     => ['%PERLFILE%'],
);
