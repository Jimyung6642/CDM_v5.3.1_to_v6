
select 
	convert(bigint, drug_exposure_id) as drug_exposure_id,
	convert(bigint, person_id) as person_id,
	drug_concept_id,
	drug_exposure_start_date,
	convert(datetime, drug_exposure_start_date) as drug_exposure_start_datetime,
	drug_exposure_end_date,
	convert(datetime, drug_exposure_end_date) as drug_exposure_end_datetime,
	NULL as verbatim_end_date,
	drug_type_concept_id,
	stop_reason,
	refills,
	quantity,
	days_supply,
	sig,
	route_concept_id,
	lot_number,
	provider_id,
	visit_occurrence_id,
	NULL as visit_detail_id,
	drug_source_value,
	drug_source_concept_id,
	route_source_value,
	dose_unit_source_value

into DatabaseSchemaCDMVersion6.drug_exposure
from DatabaseSchemaCDMVersion5.DRUG_EXPOSURE
