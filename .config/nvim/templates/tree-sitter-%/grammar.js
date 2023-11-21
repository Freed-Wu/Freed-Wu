module.exports = grammar({
  name: "{{ substitute(expand('%:p:h'), '^tree-sitter-', '', '') }}",

  rules: {
    file: ($) => "",
  },
});
