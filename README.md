SATySFi Parallel
================

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)

This is a SATySFi package providing typesetting of two column text in parallel. See [here](https://maswag.github.io/satysfi-parallel/example.pdf) and [here](https://maswag.github.io/satysfi-parallel/example-manual.pdf) for the output PDF files. This package is inspired by the [LaTeX package](https://ctan.org/pkg/parallel) with the same name.

Installation
------------

You can install SATySFi parallel with opam and Satyrographos:

```
opam install satysfi-parallel
```

Minimal Usage
-------------

The following only shows a code fragment. See the document ([html](https://maswag.github.io/satysfi-parallel/parallel-doc.html) | [pdf](https://maswag.github.io/satysfi-parallel/parallel-doc.pdf)) for a complete example.

```satysfi
+parallel <
  +p{
    The content of the left column.
  }
> <
  +p{
    The content of the right column.
  }
>
```

License
-------

All files in this repository are licensed under MIT.
