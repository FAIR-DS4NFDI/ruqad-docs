# RuQaD Architecture Documentation

This repository contains the RuQaD architecture documentation. 

We use a doc-as-code approach based on [arc42](https://arc42.org/) and the [C4
model](https://c4model.com/) using the
[structurizr](https://docs.structurizr.com/) tools for generating a static
documentation html site.

## Sources

The src directory contains the doc-as-code sources.

* [src/architecture.md](./src/architecture.md) - the arc42-based architecure documentation.
* [src/workspace.dsl](./src/workspace.dsl) - the root file of the structurizr workspace.
* [src/views/](./src/views/) - contains the structurizr views.
* [src/model/](./src/model/) - contains the structurizr model.
* [src/decisions/](./src/decisions/) - contains Architecture Decision Records (adr).

## Tools

The tools directory contains the following tools:

* [tools/serve](./tools/serve) - serve a static site on http://localhost:8080 which renders the documentation,
  including diagrams.
* [tools/validate](./tools/validate) - validate your structurizr workspace.
* [tools/structurizer-lite](./tools/structurizer-lite) - the original structurizer-lite tool. Use this to interactively
  layout single diagrams.

All tools require docker, more information in the [readme](tools/README.md) in the tools directory.

## License

* This architecture documentation is published under [CC-BY-ND 4.0](https://creativecommons.org/licenses/by-nd/4.0/)
* Copyright (C) 2024 IndiScale GmbH <mailto:info@indiscale.com>
* Copyright (C) 2024 Timm Fitschen
* Copyright (C) 2024 Alexander Schlemmer
* Copyright (C) 2024 Daniel Hornung
* Copyright (C) 2024 Henrik tom Wörden
