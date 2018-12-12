select 
	measurement_id,
	person_id,
	measurement_concept_id,
	measurement_date,
	convert(datetime, measurement_date) as measurement_datetime,
	measurement_time,
	measurement_type_concept_id,
	operator_concept_id,
	value_as_number,
	value_as_concept_id,
	unit_concept_id,
	range_low,
	range_high,
	provider_id,
	visit_occurrence_id,
	NULL as visit_detail_id,
	measurement_source_value,
	measurement_source_concept_id,
	unit_source_value,
	value_source_value

into @DatabaseSchemaCDMVersion6.measurement
from @DatabaseSchemaCDMVersion5.MEASUREMENT
