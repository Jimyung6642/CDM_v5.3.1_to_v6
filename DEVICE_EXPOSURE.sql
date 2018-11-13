select 
	convert(bigint, device_exposure_id) as device_exposure_id,
	convert(bigint, person_id) as person_id,
	device_concept_id,
	device_exposure_start_date,
	convert(datetime, device_exposure_start_date) as device_exposure_start_datetime,
	device_exposure_end_date,
	convert(datetime, device_exposure_end_date) as device_exposure_end_datetime,
	device_type_concept_id,
	unique_device_id,
	quantity,
	provider_id,
	visit_occurrence_id,
	NULL as visit_detail_id,
	device_source_value,
	device_source_concept_id

into DatabaseSchemaCDMVersion6.device_exposure
from DatabaseSchemaCDMVersion5.DEVICE_EXPOSURE
