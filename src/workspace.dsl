workspace "RuQaD" "Architecture Overview on the RuQaD Demonstrator" {
    // allow to reference fully qualified ids, e.g. ss_kb.large_storage
    !identifiers hierarchical
    !adrs "decisions"
    !docs "architecture.md"

    configuration {
        //scope landscape
    }

    !include model/model.dsl


    views {
        systemLandscape sl "RuQaD Landscape" {
            include *
            # autolayout lr
        }

        container ruqad buildingBlocks "Building Blocks" {
            include *
        }

        component ruqad.crawler rq_crawler "Building Blocks" {
            include *
        }

        styles {
            element "Element" {
                color white
            }
            element "Person" {
                background #116611
                shape person
            }
            element "Software System" {
                background #2D882D
            }
            element "Container" {
                background #55aa55
            }
            element "Database" {
                shape cylinder
            }
        }
        properties {
            "generatr.markdown.flexmark.extensions" "TableOfContents,Tables"
        }
    }
}
