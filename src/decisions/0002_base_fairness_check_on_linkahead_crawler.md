# Base check for FAIRness on LinkAhead Crawler

The quality check (for meta data) will not be implemented in the existing gitlab-runner (Demonstrator 4.2), but directly in the new ruqad-component which is based on the LinkAhead crawler.

Date: 2024-11-08

## Status

Accepted

## Context

Meta data that is contained in the exported ELN from kadi4mat needs to be checked to make sure that
the data model matches the data model of LinkAhead.

## Decision

The meta data check will be implemented in the ruqad-component in the crawler module. It will work as follows:
- The scanner of the crawler is run in order to collect all information from the file system.
- A json schema is generated from the data model in LinkAhead. This data model is stored in a YAML file.
- The meta data that was found by the scanner is validated against the json schema. In case of unsuccessful validation
  detailed error messages are shown.
- If the validation was successful, the crawler will be run completely and insert and update records in LinkAhead based on the scanning results.

## Consequences

We don't need to modify the code base of the existing gitlab-runner (Demonstrator 4.2).
Futhermore, the result of the scanner that is generated anyways will be re-used for validating the meta data.
