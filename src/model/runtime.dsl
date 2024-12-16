# Runtime view definitions

dynamic ruqad rq_runtime {
    title "Runtime view: Ingestion of a data item"

    # Get item
    ruqad.monitor -> kadi_polis "Poll new items"
    kadi_polis -> ruqad.monitor "Returns new item"

    # Quality check

    ruqad.monitor -> ruqad.quality_checker "Check quality of data item"
    ruqad.quality_checker -> demo_42 "Trigger quality check pipeline"
    demo_42 -> ruqad.quality_checker "Return quality report"
    ruqad.quality_checker -> ruqad.monitor "Return quality report"

    # FAIRness check
    ruqad.monitor -> ruqad.crawler "Trigger crawler"
    ruqad.crawler -> linkahead_crawler "Invoke with data item and quality report"
    linkahead_crawler -> ruqad.crawler "Return generated items with FAIRness level"

    # LinkAhead insert/update
    ruqad.crawler -> dataspace_node "Insert and/or update generated entities"

    autoLayout lr
}
