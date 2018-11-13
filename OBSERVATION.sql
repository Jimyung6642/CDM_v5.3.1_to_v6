select
	observation_id,
	person_id,
	observation_date,
	convert(datetime, observation_date) as observation_datetime,
	observation_type_concept_id,
	value_as_number,
	value_as_string,
	value_as_concept_id,
	qualifier_concept_id,
	unit_concept_id,
	provider_id,
	visit_occurrence_id,
	NULL as visit_detail_id,
	observation_source_value,
	observation_source_concept_id,
	unit_source_value,
	qualifier_source_value,
	NULL as observation_event_id,
	NULL as obs_event_field_concept_id,
	NULL as value_as_datetime
	
into DatabaseSchemaCDMVersion6.observation
from DatabaseSchemaCDMVersion5.OBSERVATION
