model {
    properties {
        "structurizr.groupSeparator" ":"
    }
    group "PoLiS Research Data Infrastructure" {
        kadi_polis = softwaresystem "Polis Kadi4Mat" "The Kadi4Mat electronic lab notebook instance of the PoLiS Cluster of Excellence."
    }
    group "BatCAT Data Space" {
        dataspace_node = softwaresystem "BatCAT Data Space Node" "LinkAhead and EDC-based components of the BatCAT Data Space."
        data_consumer = person "Data Consumer" "R&D departments from the consortial partners of the BatCAT Data Space."

        group "IndiScale" {
            quality_checker = softwaresystem "Quality Assurance" "Gitlab pipeline for quality assurance based on the demonstrator 4.2." {
                !docs quality_checker.md
            }
            ruqad = softwaresystem "RuQaD Demonstrator" "A purely functional component for checking FAIRness, invoking the QA pipeline and ingesting data to LinkAhead."
            data_curator = person "Data Curator" "IndiScale curates data from PoLis and offers them for reuse in the BatCAT Data Space."
        }
    }


    #linkahead = softwaresystem "LinkAhead" "LinkAhead research datamanagement system."
    #edc_framework = softwaresystem "ECD Framework" "Catalog, Provider Connector, Identity Hub and other components of the BatCAT dataspace."



    ruqad -> kadi_polis "Pull battery-related datasets."
    ruqad -> quality_checker "Invoke quality assurace pipeline on raw data from PoLiS."
    ruqad -> dataspace_node "Ingest data to LinkAhead."

    data_consumer -> dataspace_node "Browse datasets and request access for reuse."
    data_curator -> dataspace_node "Review and control the offering of datasets to the BatCAT Data Space."
}
