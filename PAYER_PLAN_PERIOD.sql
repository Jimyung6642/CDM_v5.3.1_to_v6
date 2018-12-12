select 
	payer_plan_period_id,
	person_id,
	NULL as contract_person_id,
	payer_plan_period_start_date,
	payer_plan_period_end_date,
	NULL as payer_concept_id,
	payer_source_value,
	NULL as payer_sourve_concept_id,
	NULL as plan_concept_id,
	plan_source_value,
	NULL as plan_source_concept_id,
	NULL as contract_concept_id,
	NULL as contract_source_value,
	NULL as contract_source_concept_id,
	NULL as sponsor_source_value,
	NULL as sponsor_source_concept_id,
	family_source_value,
	NULL as stop_reason_concept_id,
	NULL as stop_reason_source_value,
	NULL as stop_reason_sourve_concept_id

into @DatabaseSchemaCDMVersion6.payer_plan_period
from @DatabaseSchemaCDMVersion5.PAYER_PLAN_PERIOD
