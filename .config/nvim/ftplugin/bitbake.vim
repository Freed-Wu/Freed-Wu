setlocal include=^\s*\(inherit\|include\|require\)
setlocal includeexpr=init#init#bitbake#includeexpr()
setlocal path=.,meta/classes*,components/yocto/layers/**/classes*
