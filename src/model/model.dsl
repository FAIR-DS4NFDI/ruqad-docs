model {
    properties {
        "structurizr.groupSeparator" ":"
    }
    group "PoLiS Research Data Infrastructure" {
        kadi_polis = softwaresystem "Polis Kadi4Mat" "The Kadi4Mat electronic lab notebook instance of the PoLiS Cluster of Excellence."
    }
    group "BatCAT Data Space" {
        # Shouldn't this be split up in LinkAhead and EDC?
        dataspace_node = softwareSystem "BatCAT Data Space Node" "LinkAhead and EDC-based components of the BatCAT Data Space."
        data_consumer = person "Data Consumer" "R&D departments from the consortial partners of the BatCAT Data Space."

        group "RuQaD Service" {
            ruqad = softwareSystem "RuQaD Demonstrator" "A purely functional component for checking FAIRness, invoking the QA pipeline and ingesting data to LinkAhead." {
                monitor = container "RuQaD monitor"
                quality_checker = container "Quality checker"
                crawler = container "RuQaD Crawler" {
                    crawler_wrapper = component "Crawler wrapper"
                    converter = component "Converter"
                    transformer = component "Transformer"
                    cfood = component "CFood declaration"
                    identifiables = component "Identifiables declaration"

                    crawler_wrapper -> cfood
                    crawler_wrapper -> identifiables
                    cfood -> converter "Uses"
                    cfood -> transformer "Uses"
                }
            }
            demo_42 = softwaresystem "Quality assurance 4.2 " "Gitlab pipeline for quality assurance based on the demonstrator 4.2." {
                !docs quality_checker.md
            }
            data_curator = person "Data Curator" "IndiScale curates data from PoLis and offers them for reuse in the BatCAT Data Space."
            linkahead_crawler = softwaresystem "LinkAhead Crawler" "\
Framework for file scanning, LinkAhead entity building and synchronization."
        }
    }


    # linkahead = softwaresystem "LinkAhead" "LinkAhead research datamanagement system."
    #edc_framework = softwaresystem "ECD Framework" "Catalog, Provider Connector, Identity Hub and other components of the BatCAT dataspace."

    ruqad -> kadi_polis "Pull battery-related datasets."
    ruqad -> demo_42 "Invoke quality assurace pipeline on raw data from PoLiS."
    ruqad -> dataspace_node "Ingest data to LinkAhead."
    ruqad -> linkahead_crawler "Ingest data to LinkAhead with the LinkAhead crawler."

    data_consumer -> dataspace_node "Browse datasets and request access for reuse."
    data_curator -> dataspace_node "Review and control the offering of datasets to the BatCAT Data Space."

    kadi_polis -> ruqad.monitor "Monitored by"
    ruqad.crawler -> linkahead_crawler "Invokes"
    ruqad.crawler -> dataspace_node "Inserts data"
    ruqad.monitor -> ruqad.quality_checker
    ruqad.monitor -> ruqad.crawler
    # linkahead_crawler -> ruqad.crawler_wrapper
    ruqad.quality_checker -> demo_42 "Triggers pipeline"

    ruqad.monitor -> ruqad.crawler.crawler_wrapper
    ruqad.crawler.crawler_wrapper -> linkahead_crawler

}
