testbed = deploymentEnvironment "BatCAT Testbed" {
    deploymentNode "Kubernetes Cluster" {
        deploymentNode "Several Pods" {
            description "The BatCAT Data Space Node and all other software systems are being grouped together in this diagram for simplicity. The overall number of pods in the testbed which are only concerned with the data space components is > 10."

            softwaresystemInstance dataspace_node
        }

        deploymentNode "Kadi Pod" {
            softwaresystemInstance kadi_polis
        }
        deploymentNode "Ruqad Pod" {
            softwaresystemInstance ruqad
        }
    }

    deploymentNode "Gitlab" {
        description "The gitlab instance can not be integrated into the testbed."
        softwaresystemInstance demo_42
    }
}
