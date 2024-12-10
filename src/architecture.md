# RuQaD Architecture

[TOC]

## Introduction and Goals

### Requirements Overview

### Quality Goals

### Stakeholders

test

| Role/Name   | Contact        | Expectations       |
|-------------|----------------|--------------------|
| *\<Role-1>* | *\<Contact-1>* | *\<Expectation-1>* |
| *\<Role-2>* | *\<Contact-2>* | *\<Expectation-2>* |
| IndiScale   |                |                    |
| PoLis       |                |                    |


## Architecture Constraints

## Context and Scope

### Business Context

**\<Diagram or Table>**

**\<optionally: Explanation of external domain interfaces>**

### Technical Context

#### System Landscape

![System Landscape Diagram](embed:sl)


**\<Diagram or Table>**

**\<optionally: Explanation of technical interfaces>**

**\<Mapping Input/Output to Channels>**

## Solution Strategy

## Building Block View

### Whitebox Overall System

***\<Overview Diagram>***

Motivation  
*\<text explanation>*

Contained Building Blocks  
*\<Description of contained building block (black boxes)>*

Important Interfaces  
*\<Description of important interfaces>*

#### LinkAhead Crawler

*\<Purpose/Responsibility>*
Scans files in specific directories of the file system and synchronizes them with the LinkAhead instance. Before insertion and updates of
`Records` in LinkAhead, a meta data check is carried out to verify whether the meta data that was exported from kadi4mat is compatible with
the target data model (in LinkAhead and the EDC). Validation failure leads to specific validation error messages and prevents insertions or updates
of the scan result.

*\<Interface(s)>*
The crawler component consists of:
- A cfood (file in YAML format) which specifies the mapping from data found on the file system to `Records` in LinkAhead.
- A definition of the identifiables (file in YAML format) which defines the properties that are needed to uniquely identify `Records` of the data model in LinkAhead.
- The data model definition (file in YAML format). This is needed by the crawler to do the meta data check.
- Crawler extensions specific to the project (cusotm converters and custom transformers). These are python modules 
  containing functions and classes that can be referenced within the cfood.

The interface is a Python-function that is implemented as a module into the RuQaD demonstrator. The function calls the scanner and main crawler functions of the
LinkAhead crawler software.

*\<(Optional) Quality/Performance Characteristics>*

*\<(Optional) Directory/File Location>*
- Main interface: `ruqad/src/ruqad/crawler.py`
- Crawler extensions:
  - Custom converters (currently not used): `ruqad/src/ruqad/crawler-extensions/converters.py`
  - Custom transformers: `ruqad/src/ruqad/crawler-extensions/transformers.py`

*\<(Optional) Fulfilled Requirements>*

*\<(optional) Open Issues/Problems/Risks>*

#### \<Name black box 2>

*\<black box template>*

#### \<Name black box n>

*\<black box template>*

#### \<Name interface 1>

…

#### \<Name interface m>

### Level 2

#### White Box *\<building block 1>*

*\<white box template>*

#### White Box *\<building block 2>*

*\<white box template>*

…

#### White Box *\<building block m>*

*\<white box template>*

### Level 3

#### White Box \<\_building block x.1\_\>

*\<white box template>*

#### White Box \<\_building block x.2\_\>

*\<white box template>*

#### White Box \<\_building block y.1\_\>

*\<white box template>*

## Runtime View

### \<Runtime Scenario 1>

-   *\<insert runtime diagram or textual description of the scenario>*

-   *\<insert description of the notable aspects of the interactions
    between the building block instances depicted in this diagram.>*

### \<Runtime Scenario 2>

### …

### \<Runtime Scenario n>

## Deployment View

### Infrastructure Level 1

***\<Overview Diagram>***

Motivation  
*\<explanation in text form>*

Quality and/or Performance Features  
*\<explanation in text form>*

Mapping of Building Blocks to Infrastructure  
*\<description of the mapping>*

### Infrastructure Level 2

#### *\<Infrastructure Element 1>*

*\<diagram + explanation>*

#### *\<Infrastructure Element 2>*

*\<diagram + explanation>*

…

#### *\<Infrastructure Element n>*

*\<diagram + explanation>*

## Cross-cutting Concepts

### *\<Concept 1>*

*\<explanation>*

### *\<Concept 2>*

*\<explanation>*

…

### *\<Concept n>*

*\<explanation>*

## Architecture Decisions

## Quality Requirements

### Quality Tree

### Quality Scenarios

## Risks and Technical Debts

## Glossary

| Term        | Definition        |
|-------------|-------------------|
| *\<Term-1>* | *\<definition-1>* |
| *\<Term-2>* | *\<definition-2>* |
