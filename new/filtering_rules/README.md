# Filtering rules
The [Eurlex Layer](https://citnet.tech.ec.europa.eu/CITnet/confluence/display/CELLAR/Eurlex+Layer) is responsible for building the aggregated RDF model that is transformed into the new XML format. Here there is a proposal to extract the annotations from the ontology (CDM) and use two configuration files:

 1. **rules.json** to define the general behavior
	- JSON sample: [here](https://raw.githubusercontent.com/op-cellar-git/eurlex-xml-format/master/new/filtering_rules/samples/rules.json)
	- JSON schema: [here](https://raw.githubusercontent.com/op-cellar-git/eurlex-xml-format/master/new/filtering_rules/json_schema/schema_exceptions.json)
 2. **exceptions.json**  to define some exceptions in the embedding rules
	- JSON sample: [here](https://raw.githubusercontent.com/op-cellar-git/eurlex-xml-format/master/new/filtering_rules/samples/exceptions.json)
	- JSON schema: [here](https://raw.githubusercontent.com/op-cellar-git/eurlex-xml-format/master/new/filtering_rules/json_schema/schema_exceptions.json)

In the samples, there is only a hypothetical set of properties. The samples serve to give an idea of the structure. They are clearly not exhaustive for Eurlex's business.

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
-   `to_target`: this is the target property for the embedding.
-   `level`: this field indicates at what level of the FRBR (or dossier/event) the exception is valid.
-   `to_expand`:  flag to activate or deactivate the embedding of a target property. The value `false` must be used when Cellar must ignore an embedding rule defined in *rules.json* for a given class.
-   `to_index`:  it is analogous to `to_expand` for the policies of embedding in indexation.
-   `targets_in_embedded_notice`: this is a list of properties that must exceptionally be embedded in the context defined by `class`, `level`, and `to_target`. In the case of concept or data type property, the content of the list will be ignored by Cellar.
-  `targets_to_be_indexed`: it is analogous to `targets_in_embedded_notice` for the policies of embedding in indexation.
### Example of entries in JSON:
```
{     "class": "cdm:act_preparatory",
      "rules": 
       [
        {
         "to_target": "cdm:resource_legal_based_on_concept_treaty",
         "level": ["work", "expression"],
         "to_expand": true,
         "to_index": true,
         "targets_in_embedded_notice": [],
	     "targets_to_be_indexed": []
        },
        {
         "to_target": "cdm:resource_legal_published_in_official-journal",
         "level": ["work", "expression"],
         "to_expand": true,
         "to_index": true,
         "targets_in_embedded_notice": ["cdm:official-journal_number", "cdm:work_created_by_agent", "cdm:official-journal_part_of_collection_document"],
         "targets_to_be_indexed": ["cdm:official-journal_number", "cdm:work_created_by_agent"]
        }
       ]
},
{     "class": "cdm:official-journal",
      "rules": 
       [
        {
         "to_target": "cdm:work_created_by_agent",
         "level": ["work", "expression", "manifesation"],
         "to_expand": false,
         "to_index": false,
         "targets_in_embedded_notice": [],
         "targets_to_be_indexed": []
        },
        {
         "to_target": "cdm:work_id_obsolete_notice",
         "level": ["work", "expression"],
         "to_expand": false,
         "to_index": false,
         "targets_in_embedded_notice": [],
         "targets_to_be_indexed": []
        }
       ]
}
```