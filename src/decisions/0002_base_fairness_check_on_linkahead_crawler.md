# Base check for FAIRness on LinkAhead Crawler

<!--This decision was made prior to the beginning of the project in the proposal.

Date: 2024-10-01-->

<!-- TODO: Describe: Don't implement fairness check in 4.2 demonstrator, but in linkahead crawler. -->

<!-- TODO: Alex -->

<!-- TODO: Check date of protocol. -->

## Status

Accepted

## Context

<!--Pulling data from Kadi4Mat and publishing it to the EDC-based BatCAT Data Space.-->

## Decision

<!--We will use the LinkAhead Crawler as the base of the RuQaD Demonstrator.

In the BatCAT Data Space LinkAhead is being used as Data and Knowlegde
Management System. Instead of publishing assets directly to the catalog which
would leave us with the task to host and serve the raw data, we can reuse this
infrastructure.

The established way to insert data into LinkAhead following an ETL approach is
the LinkAhead Crawler.

Additionally, the LinkAhead Crawler is a Python framework and Kadi4Mat has a
Python API as well which is a good match.-->

## Consequences

<!--We don't have to take car about the hosting and serving of the data in the data
space. The RuQaD Demonstrator will be a purely functional, i.e. stateless
component.

We have a solid base for defining the mapping from the input data to the
desired output and for defining and checking criteria, e.g. FAIRness criteria.

On the downside, the RuQaD demonstrator will only be usable for system
landscapes and Data Spaces using LinkAhead. However, it is always possible to
just add a LinkAhead instance to any EDC-based data space.-->
