# RuQaD Architecture

[TOC]

## Introduction and Goals

<!--
<https://docs.arc42.org/section-1/>
-->

### Requirements Overview


The aim of the project is to build a demonstrator that connects the data management system kadi4mat and EDC allowing for quality checked data exchange from kadi4mat to EDC.
This needs to be achieved by a tool that exports data from the source system, carries out quality and meta data checks (involving an existing pipeline) and importing the
data into the target system. 

The motivation is to allow a seamless exchange of data between research and industry.
It is important to ensure that the FAIR criteria are met, therefore a dedicated check for meta data and the FAIR criteria is implemented.
The FAIR criteria can be summarized to the following practical checks:
- Is a PID present?
- Is the domain-specific meta data complete?
- Is there provenance information?
- Does the data include license information?

The normative description of all requirements is contained in the non-public project proposal.

### Quality Goals

<!--
> The top three (max five) quality goals for the architecture whose fulfillment is of highest
> importance to the major stakeholders. We really mean quality goals for the architecture. Don’t
> confuse them with project goals. They are not necessarily identical.
>
> The ISO 25010 standard provides a nice overview of potential topics of interest:
>
> ...
-->

RuQaD's main quality goals are, using the terms from ISO 25010 (see glossary for definitions):

- Operability
- Compatibility
- Transferability
- Maintainability


### Stakeholders

<!--
> Explicit overview of stakeholders of the system, i.e. all person, roles or organizations that
>
> - should know the architecture
> - have to be convinced of the architecture
> - have to work with the architecture or with code
> - need the documentation of the architecture for their work
> - have to come up with decisions about the system or its development
-->


<b style="color: red; font-size: 32pt">TODO</b>

| Role/Name        | Expectations                                                 |
|------------------|--------------------------------------------------------------|
| IndiScale        | Quality and FAIRness of entities are successfully annotated. |
| PoLis / Kadi4Mat | Entities can be exported to other dataspaces.                |
| BatCAT Dataspace | Receive valuable dataset offers.                                      |
| FAIR DS Project  | Showcase the concept of FAIR Data Spaces with a relevant, plausible and convincing use case. |


<!--
## Architecture Constraints

<https://docs.arc42.org/section-2/>

> Any requirement that constrains software architects in their freedom of design and implementation
> decisions or decision about the development process. These constraints sometimes go beyond
> individual systems and are valid for whole organizations and companies.
-->

## Context and Scope

<!--
<https://docs.arc42.org/section-3/>

> System scope and context - as the name suggests - delimits your system (i.e. your scope) from all
> its communication partners (neighboring systems and users, i.e. the context of your system). It
> thereby specifies the external interfaces.
>
> If necessary, differentiate the business context (domain specific inputs and outputs) from the
> technical context (channels, protocols, hardware).
-->



### Business Context

<!--
> Specification of all communication partners (users, IT-systems, …) with explanations of domain
> specific inputs and outputs or interfaces. Optionally you can add domain specific formats or
> communication protocols.
-->

<b style="color: red; font-size: 32pt">TODO</b>

**\<Diagram or Table>**

**\<optionally: Explanation of external domain interfaces>**

### Technical Context

<!--
> Technical interfaces (channels and transmission media) linking your system to its environment. In
> addition a mapping of domain specific input/output to the channels, i.e. an explanation with I/O
> uses which channel.
-->

#### System Landscape

![System Landscape Diagram](embed:sl)


**\<Diagram or Table>**

**\<optionally: Explanation of technical interfaces>**

**\<Mapping Input/Output to Channels>**

<!--
## Solution Strategy

<https://docs.arc42.org/section-4/>

> A short summary and explanation of the fundamental decisions and solution strategies, that shape the
> system’s architecture. These include
>
> - technology decisions
> - decisions about the top-level decomposition of the system, e.g. usage of an architectural pattern
>   or design pattern
> - decisions on how to achieve key quality goals
> - relevant organizational decisions, e.g. selecting a development process or delegating certain
>   tasks to third parties.


-->

## Building Block View

<!--
<https://docs.arc42.org/section-5/>

> The building block view shows the static decomposition of the system into building blocks (modules,
> components, subsystems, classes, interfaces, packages, libraries, frameworks, layers, partitions,
> tiers, functions, macros, operations, data structures, …) as well as their dependencies
> (relationships, associations, …)
>
> This view is mandatory for every architecture documentation. In analogy to a house this is the floor
> plan.
-->

<b style="color: red; font-size: 32pt">TODO</b>

### Whitebox Overall System

<!--
> Here you describe the decomposition of the overall system using the following white box template. It contains
>
> - an overview diagram
> - a motivation for the decomposition
> - black box descriptions of the contained building blocks. For these we offer you alternatives:
>   - use one table for a short and pragmatic overview of all contained building blocks and their interfaces
>   - use a list of black box descriptions of the building blocks according to the black box template (see below). Depending on your choice of tool this list could be sub-chapters (in text files), sub-pages (in a Wiki) or nested elements (in a modelling tool).
> - (optional:) important interfaces, that are not explained in the black box templates of a building block, but are very important for understanding the white box.
>
> Since there are so many ways to specify interfaces why do not provide a specific template for them.
>
> In the best case you will get away with examples or simple signatures.
-->

<b style="color: red; font-size: 32pt">TODO</b>

![Building Blocks](embed:buildingBlocks)

##### Rationale #####

The RuQaD demonstrator uses *service integration* to achieve the goal of connecting
dataspaces in a FAIR manner.  It configures and combines existing services to multiple stages of
FAIRness evalution and data integration.

##### Contained Building Blocks #####

- **Monitor:** Checks for new data in a Kadi4Mat instance.
- **Quality checker:** Passes new data to the quality checker which was developed in WP 4.2 of the
  previous Fair DS project.
- **RuQaD crawler:** Calls the LinkAhead crawler for metadata checking and for insertion into the
  BatCAT data space node.

#### Monitor ####

The monitor continuously polls a *Kadi4Mat* instance (representing the source dataspace) for new
data items.

Each new data item is passed on to the quality checker for evaluation of the data quality.
Afterwards the monitor passes the quality check report and the original data to the crawler, which
eventually leads to insertion in the *BatCAT* data space where the items can be checked by *data
curators* and retrieved by *data consumers*.

**Source code:** `src/ruqad/monitor.py`

#### Quality Checker ####

*\<Purpose/Responsibility>*

The quality checker executes data quality checks on the data which was retrieved from the input
dataspace (a Kadi4Mat instance in this case).  It provides a structured summary for other components
and also a detailed report for human consumption.

*\<Interface(s)>*

The quality checker is implemented as a Python class `QualityChecker` which provides mainly a
`check(filename, target_dir)` method to check individual files.  This class is available in the
module `ruqad.qualitycheck`.

*\<(Optional) Quality/Performance Characteristics>*

The quality checker relies on the [demonstrator 4.2](https://git.rwth-aachen.de/fair-ds/ap-4-2-demonstrator/ap-4.2-data-validation-and-quality-assurance-demonstrator) to perform the checks.  Thus, RuQaD relies
on further maintenance by the demonstrator's development team.

*\<(Optional) Directory/File Location>*

**Source code:** `src/ruqad/qualitycheck.py`

*\<(Optional) Fulfilled Requirements>*

*\<(optional) Open Issues/Problems/Risks>*

##### Open issues #####

- The demonstrator 4.2 service currently relies on running as Gitlab pipeline jobs, which introduces
  a certain administrative overhead for production deployment.
- It is possible and may be desirable to parallelize the quality check for multiple files by
  distributing the load on a number of service workers, instead of checking files sequentially.

#### RuQaD Crawler

*\<Purpose/Responsibility>*

The RuQaD Crawler executes metadata checks and bundles data and metadata for insertion into the
BatCAT dataspace.

*\<Interface(s)>*

The crawler is implemented as a Python module with a function `trigger_crawler(...)` which looks for
data and quality check files to evaluate and insert into the BatCAT dataspace.  It uses LinkAhead's
crawler framework for metadata checks, object creation and interaction with the target dataspace.

*\<(Optional) Quality/Performance Characteristics>*
*\<(Optional) Directory/File Location>*

**Source code:** `src/ruqad/crawler.py`

*\<(Optional) Fulfilled Requirements>*
*\<(optional) Open Issues/Problems/Risks>*


<!-- #### \<Name black box 2> -->

<!-- *\<black box template>* -->

<!-- *\<Purpose/Responsibility>* -->
<!-- *\<Interface(s)>* -->
<!-- *\<(Optional) Quality/Performance Characteristics>* -->
<!-- *\<(Optional) Directory/File Location>* -->
<!-- *\<(Optional) Fulfilled Requirements>* -->
<!-- *\<(optional) Open Issues/Problems/Risks>* -->


<!-- #### \<Name black box n> -->

<!-- *\<black box template>* -->

<!-- *\<Purpose/Responsibility>* -->
<!-- *\<Interface(s)>* -->
<!-- *\<(Optional) Quality/Performance Characteristics>* -->
<!-- *\<(Optional) Directory/File Location>* -->
<!-- *\<(Optional) Fulfilled Requirements>* -->
<!-- *\<(optional) Open Issues/Problems/Risks>* -->

<!-- #### \<Name interface 1> -->

<!-- … -->

<!-- #### \<Name interface m> -->

### Level 2

#### White Box RuQaD Crawler

![Component Diagram](embed:rq_crawler)

###### Motivation ######

The Crawler reuses functionality of the LinkAhead crawler:
- Declarative creation of data objects from structured input data.
- Idempotent and context sensitive scan-create-and-insert-or-update procedures.

This functionality is extended by a custom converters and data transformers.

##### Contained Building Blocks #####

- **Crawler wrapper:** Calls the LinkAhead crawler on the files given by the RuQaD monitor, with the
  correct settings.
- **CFood declaration:** Specification of how entities in BatCAT shall be [constructed from input
  data](https://docs.indiscale.com/caosdb-crawler/cfood.html).
- **Identifiables declaration:** Specification of [identifiying properties](https://docs.indiscale.com/caosdb-crawler/concepts.html#identifiables) of entities in BatCAT.
- **Converter:** Custom conversion plugin to create resulting (sub) entities.
- **Transformer:** Custom conversion plugin to transform input data into properties.

*<(optionally) describe important interfaces>*

##### Crawler wrapper #####

<b style="color: red; font-size: 32pt">TODO: rewrite from overall view to wrapper component description</b>

*\<Purpose/Responsibility>*  

The crawler wrapper scans files in specific directories of the file system and synchronizes them
with the LinkAhead instance. Before insertion and updates of `Records` in LinkAhead, a meta data
check is carried out to verify whether the meta data that was exported from kadi4mat is compatible
with the target data model (in LinkAhead and the EDC). Validation failure leads to specific
validation error messages and prevents insertions or updates of the scan result. The software
component also carries out a check of data FAIRness of the data exported from kadi4mat (in ELN
format).

*\<Interface(s)>*
The crawler uses:
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
- Data ingest from exported ELN file into LinkAhead.
- Data ingest from quality check into LinkAhead.
- Check of FAIRness of data from ELN file.
- Meta data check

*\<(optional) Open Issues/Problems/Risks>*

<!-- #### White Box *\<building block 2>* -->

<!-- *\<white box template>* -->

<!-- … -->

<!-- #### White Box *\<building block m>* -->

<!-- *\<white box template>* -->

<!-- ### Level 3 -->

<!-- #### White Box \<\_building block x.1\_\> -->

<!-- *\<white box template>* -->

<!-- #### White Box \<\_building block x.2\_\> -->

<!-- *\<white box template>* -->

<!-- #### White Box \<\_building block y.1\_\> -->

<!-- *\<white box template>* -->

## Runtime View

<!--
[https://docs.arc42.org/section-6/](https://docs.arc42.org/section-6/)

> The runtime view describes concrete behavior and interactions of the system’s building blocks in form of scenarios from the following areas:
>
> 1. important use cases or features: how do building blocks execute them?
> 2. interactions at critical external interfaces: how do building blocks cooperate with users and neighbouring systems?
> 3. operation and administration: launch, start-up, stop
> 4. error and exception scenarios
>
> Remark: The main criterion for the choice of possible scenarios (sequences, workflows) is their architectural relevancy. It is not important to describe a large number of scenarios. You should rather document a representative selection.

-->

The RuQaD monitor runs continually and acts on new data items.  The handling of one such data item
is described here.

### Ingestion of a data item

![Data item ingestion](embed:rq_runtime)

- The monitor continually polls the Kadi4Mat server for new items.
- Each new item is sequentially passed to the Demonstrator 4.2 quality checker for *data* quality
  checks and the crawler component for *metadata* FAIRness evaluation before being inserted into the
  target dataspace at BatCAT.

<!-- ### \<Runtime Scenario 2> -->

<!-- ### … -->

<!-- ### \<Runtime Scenario n> -->

## Deployment View

<b style="color: red; font-size: 32pt">TODO</b>

<!--
[https://docs.arc42.org/section-7/](https://docs.arc42.org/section-7/)

> The deployment view describes:
>
> 1. the technical infrastructure used to execute your system, with infrastructure elements like geographical locations, environments, computers, processors, channels and net topologies as well as other infrastructure elements and
> 2. the mapping of (software) building blocks to that infrastructure elements.
>
> Often systems are executed in different environments, e.g. development environment, test environment, production environment. In such cases you should document all relevant environments.
>
> Especially document the deployment view when your software is executed as distributed system with more then one computer, processor, server or container or when you design and construct your own hardware processors and chips.
>
> From a software perspective it is sufficient to capture those elements of the infrastructure that are needed to show the deployment of your building blocks. Hardware architects can go beyond that and describe the infrastructure to any level of detail they need to capture.

-->
### Infrastructure Level 1

<!--

> Describe (usually in a combination of diagrams, tables, and text):
>
> 1. the distribution of your system to multiple locations, environments, computers, processors, .. as well as the physical connections between them
> 2. important justification or motivation for this deployment structure
> 3. Quality and/or performance features of the infrastructure
> 4. the mapping of software artifacts (building blocks) to elements of the infrastructure
 
 -->

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

<!--
[https://docs.arc42.org/section-8/](https://docs.arc42.org/section-8/)

> This section describes overall, principal regulations and solution ideas that are relevant in multiple parts (→ cross-cutting) of your system. Such concepts are often related to multiple building blocks. They include many different topics, such as
>
> - domain models
> - architectural patterns or design patterns
> - rules for using specific technology
> - principale, often technical decisions of overall decisions
> - implementation rules
-->


### Using YAML for storing machine readable information

The YAML format is used in several components of the software for storing and exchanging information in a
format that is machine-readable and also human-readable at the same time.

### REST interfaces

Multiple components of the software use REST interfaces for data exchange.

- Gitlab-API
- kadi4mat-export (?)
- LinkAhead

### *\<Concept n>*

*\<explanation>*

<!--
## Architecture Decisions

<https://docs.arc42.org/section-9/>

> Important, expensive, large scale or risky architecture decisions including rationales. With
> “decisions” we mean selecting one alternative based on given criteria.
>
> Please use your judgement to decide whether an architectural decision should be documented here in
> this central section or whether you better document it locally (e.g. within the white box template
> of one building block). Avoid redundant texts. Refer to section 4, where you captured the most
> important decisions of your architecture already.

## Quality Requirements

<https://docs.arc42.org/section-10/>

> This section contains all quality requirements as quality tree with scenarios. The most important
> ones have already been described in section 1.2. (quality goals)
>
> Here you can also capture quality requirements with lesser priority, which will not create high
> risks when they are not fully achieved.

### Quality Tree

> The table or tree (as defined in ATAM – Architecture Tradeoff Analysis Method) of quality
> requirements, with quality/evaluation scenarios as leaves.

### Quality Scenarios

> Concretization of (sometimes vague or implicit) quality requirements using (quality) scenarios.
>
> These scenarios describe what should happen when a stimulus arrives at the system.
>
> For architects, two kinds of scenarios are important:
>
> - Usage scenarios (also called application scenarios or use case scenarios) describe the system’s
>   runtime reaction to a certain stimulus. This also includes scenarios that describe the system’s
>   efficiency or performance. Example: The system reacts to a user’s request within one second.
> - Change scenarios describe a modification of the system or of its immediate environment. Example:
>   Additional functionality is implemented or requirements for a quality attribute change.

## Risks and Technical Debts

<https://docs.arc42.org/section-11/>

> A list of identified technical risks or technical debts, ordered by priority

-->

## Glossary

[//]: # (These are probably defined in: https://www.iso.org/standard/78176.html)

| Term        | Definition        |
|-------------|-------------------|
| Operability (ISO 25010) | "System can be understood, learned, used and is attractive to users." |
| Transferability (ISO 25010) | "System can be transferred from one environment to another." |
| Maintainability (ISO 25010) | "System can be modified, corrected, adapted or improved due to changes in environment or requirements." |
| Compatibility (ISO 25010) | "Two or more systems can exchange information while sharing the same environment." |
