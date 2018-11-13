select 
	procedure_occurrence_id,
	person_id,
	procedure_concept_id,
	procedure_date,
	convert(datetime, procedure_date) as procedure_datetime,
	procedure_type_concept_id,
	modifier_concept_id,
	quantity,
	provider_id,
	visit_occurrence_id,
	procedure_source_value,
	procedure_source_concept_id,
	NULL as modifier_source_value

into DatabaseSchemaCDMVersion6.dbo.procedure_occurrence
from DatabaseSchemaCDMVersion5.PROCEDURE_OCCURRENCE
