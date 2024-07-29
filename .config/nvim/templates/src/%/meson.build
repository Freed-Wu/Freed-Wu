py = import('python').find_installation(pure: false)

py.extension_module(
  '__init__',
  '__init__.c',
  subdir: '{{ expand('%:p:h:t') }}',
  install: true,
)
py.install_sources(
  ['__init__.pyi'],
  subdir: '{{ expand('%:p:h:t') }}',
)
