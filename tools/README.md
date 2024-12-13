# Documentation tools #

This directory contains a few utility scripts:

- serve: Render and serve the documentatil as html.
- validate: Validate the documentation files.
- structurizer-lite: Web server for layouting diagrams.

All these tools require Docker to run, they should be started from this repo's top level directory,
otherwise they will not find the documentation sources.

## serve ##

Running `tools/serve` starts a web server on http://localhost:8080 which renders the documentation
as html, including the diagrams.

This uses the [structurizr-site-generatr](https://github.com/avisi-cloud/structurizr-site-generatr) to serve the documentation saved in `src/workspace.dsl`.

## validate ##

`tools/validate` starts a Docker container which runs validation checks on `src/workspace.dsl`.

## structurizer-lite ##

`tools/structurizer-lite` starts a *structurizr* container which allows some editing of the
diagrams.  However, it is not quite clear how these diagrams are saved/exported..?
