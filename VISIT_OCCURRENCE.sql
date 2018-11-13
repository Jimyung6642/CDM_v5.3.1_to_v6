
select 
	visit_occurrence_id,
	person_id,
	visit_concept_id,
	visit_start_date,
	convert(datetime, visit_start_date) as visit_start_datetime,
	visit_end_date,
	convert(datetime, visit_end_date) as visit_end_datetime,
	visit_type_concept_id,
	provider_id,
	care_site_id,
	visit_source_value,
	visit_source_concept_id,
	NULL as admitted_from_concept_id,
	NULL as admitted_from_source_value,
	NULL as discharge_to_concept_id,
	NULL as discharge_to_source_value,
	NULL as preceding_visit_occurrence_id

into DatabaseSchemaCDMVersion6.visit_occurrence
from DatabaseSchemaCDMVersion5.VISIT_OCCURRENCE
