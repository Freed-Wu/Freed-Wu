#!/usr/bin/env octave
pkg load {{ expand('%:p:h:t') }};
error = 0;
funcs = {'{{ expand('%:p:h:t') }}'};
for i = funcs
  error += length(strfind(evalc(['test ', i{1}]), 'error:'));
end
exit(error);
