
# Filtering rules
The [Eurlex Layer](https://citnet.tech.ec.europa.eu/CITnet/confluence/display/CELLAR/Eurlex+Layer) is responsible for building the aggregated RDF model that is transformed into the new XML format. Here there is a proposal to extract the annotations from the ontology (CDM) and use two configuration files:

 1. **rules.json** to define the general behavior
	- JSON sample: [here](https://raw.githubusercontent.com/op-cellar-git/eurlex-xml-format/master/new/filtering_rules/samples/rules.json)
	- JSON schema: [here](https://raw.githubusercontent.com/op-cellar-git/eurlex-xml-format/master/new/filtering_rules/json_schema/schema_exceptions.json)
 2. **exceptions.json**  to define some exceptions in the embedding rules
	- JSON sample: [here](https://raw.githubusercontent.com/op-cellar-git/eurlex-xml-format/master/new/filtering_rules/samples/exceptions.json)
	- JSON schema: [here](https://raw.githubusercontent.com/op-cellar-git/eurlex-xml-format/master/new/filtering_rules/json_schema/schema_exceptions.json)

## rules.json
They look like the current approach, but instead of spreading these annotations all over the CDM, they are collected in an external JSON configuration file:
-   `to_expand`: triggers an embedding of the target resource in all notice types.
-   `in_embedded_notice`: the annotated property is included in the expansion of the object property in all notice types.
-   `in_notice`: the annotated property is included in the tree, branch, and object notice.
-   `to_be_indexed`: the annotated property is included in the indexation notice.
-   `is_concept_hierarchy`: triggers the serialization of a nested concept hierarchy. This serialization replaces the former "facet" and "level" representation.

Based on these annotations and taking into account all the exceptions for a given class, the Eurlex Service determines which metadata to aggregate in its RDF model.
### Example of entry in JSON:
```
{
	"propety": "cdm:resource_legal_published_in_official-journal",
	"annotations": {
		"to_expand": true,
		"in_embedded_notice": true,
		"to_be_indexed": true,
		"is_concept_hierarchy": false
	}
}
```
## exceptions.json
In some cases, Eurlex is interested in obtaining a specific behavior relative to specific classes involved in the embedding. Therefore, Cellar needs an additional configuration file to drive these exceptional behaviors.
-   `class`: the owl class for which the dissemination must follow a particular behavior in the embedding policies.
-   `to_embed`:  flag to activate or deactivate the embedding of a target property. The value `false` must be used when Cellar must ignore a "to_expand" in *rules.json* for a given class.
-   `level`: this field indicates at what level of the FRBR the exception is valid.
-   `to_target`: this is the target property for the embedding.
-   `inclusions`: these properties are exceptionally "in_embedded_notice" in the context of the target property already set.
### Example of entry in JSON:
```
{
      "class": "cdm:act_preparatory",
      "rules": [
		  { "to_embed": "false",
		    "level": ["work", "expression"],
		    "to_target": "cdm:resource_legal_based_on_concept_treaty"
		  },
                  { "to_embed": "true",
                    "level": ["work", "expression"],
                    "to_target": "cdm:resource_legal_published_in_official-journal",
                    "inclusions": ["cdm:official-journal_number", "cdm:work_created_by_agent", "cdm:official-journal_part_of_collection_document"]
	          }
	       ]
}
```
