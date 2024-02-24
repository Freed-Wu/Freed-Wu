/// <reference types="tree-sitter-cli/dsl" />

module.exports = grammar({
  name: "{{ substitute(expand('%:p:h:t'), '^tree-sitter-', '', '') }}",

  rules: {
    file: ($) => "",
  },
});
