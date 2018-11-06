-- Make a new CDM version_6 of condition_occurrence using CDM version_5
-- The value of each variable depends on the characterisrics of each Database
select 
	condition_occurrence_id,
	person_id,
	condition_concept_id,
	condition_start_date,
	cast(condition_start_date as datetime) as condition_start_datetime,
	condition_end_date,
	cast(condition_end_date as datetime) as condition_end_datetime,
	condition_type_concept_id,
	NULL as condition_status_concept_id, 
	stop_reason,
	provider_id,
	visit_occurrence_id,
	condition_source_value,
	condition_source_concept_id

into $$$$.condition_occurrence_v6
from $$$$.CONDITION_OCCURRENCE


--Insert Death data into Condition_occurrence_v6
Insert into $$$$.condition_occurrence_v6
select 
	convert(bigint, convert(varchar, (select max(condition_occurrence_id) as max_id from nhis_nsc_new.dbo.CONDITION_OCCURRENCE)
			 + convert(varchar, ROW_NUMBER() OVER(order by person_id)))) as condition_occurrence_id,
	person_id as person_id,
	cause_concept_id as condition_concept_id,
	death_date as condition_start_date,
	cast(death_date as datetime) as condition_start_datetime,	
	NULL as condition_end_date,
	NULL as condition_end_datetime,
	death_type_concept_id as condition_type_concept_id,
	NULL as condition_status_concept_id,
	NULL as stop_reason,
	NULL as provider_id,
	NULL as visit_occurrence_id,  	
	cause_source_value as condition_source_value,
	NULL as condition_source_concept_id

from nhis_nsc_new.dbo.death 
