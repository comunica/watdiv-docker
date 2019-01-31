# WatDiv Docker

[![Docker Automated Build](https://img.shields.io/docker/automated/comunica/watdiv.svg)](https://hub.docker.com/r/comunica/watdiv/)

A Dockerfile for the [Waterloo SPARQL Diversity Test Suite (WatDiv)](https://dsg.uwaterloo.ca/watdiv/).

## Requirements

* [Docker](https://www.docker.com/)

## Install

```bash
$ docker pull comunica/watdiv
```

## Usage

```bash
$ docker run --rm -it -v $(pwd)/output/:/output comunica/watdiv -s 1 -q 10 -r 1
```

This will create a dataset at `output/dataset.nt` and corresponding queries in `output/queries`.

Options:
* `-s`: Scale factor (1 ~= 100K triples), defaults to 1.
* `-q`: Query count, defaults to 5.
* `-r`: Query recurrence factor.

For more details on the usage of this tool, please refer to the official [WatDiv website](https://dsg.uwaterloo.ca/watdiv/).

## License
This Dockerfile is copyrighted by [Ghent University – imec](http://idlab.ugent.be/)
and released under the [MIT license](http://opensource.org/licenses/MIT).
WatDiv is owned by the [University of Waterloo](https://uwaterloo.ca/).
