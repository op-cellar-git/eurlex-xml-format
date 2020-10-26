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

Based on rules and taking into account all the exceptions for a given class, the Eurlex Service determines which metadata to aggregate in its RDF model.
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

-   `property`: the specific property to expand in the embedding policies. This field is not mandatory. 
-   `class`: the owl class for which the embedding policy must follow a particular behavior. This field is mandatory.
-   `level`: this field indicates at what level of the FRBR (or dossier/event) the exception is valid. This field is mandatory.
-   `targets_in_embedded_notice`: this is a list of properties that must exceptionally be embedded in the context defined by `class`, `level` and the `property` to expand. In case this list is empty Cellar will embed only the "URI" and the relative SAMEAS. This field is mandatory.
-   `targets_to_be_indexed`: it is analogous to `targets_in_embedded_notice` for the indexation.

### Example of entry in JSON:
```
{
    "property": "cdm:dossier_initiated_by_act_preparatory",
	"class": "cdm:act_preparatory",
    "level": ["work"],
    "targets_in_embedded_notice": ["cdm:work_is_about_concept_eurovoc", "cdm:work_date_document", "cdm:resource_legal_is_about_concept_directory-code", "cdm:id_celex", "rdf:type", "cdm:resource_legal_number_natural_celex", "cdm:id_sector", "cdm:work_has_resource-type"],
    "targets_to_be_indexed": ["cdm:work_is_about_concept_eurovoc", "cdm:work_date_document", "cdm:resource_legal_is_about_concept_directory-code", "cdm:id_celex", "rdf:type", "cdm:resource_legal_number_natural_celex", "cdm:id_sector", "cdm:work_has_resource-type"]
}
```