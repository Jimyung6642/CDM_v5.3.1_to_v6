select
	condition_era_id,
	person_id,
	condition_concept_id,
	convert(datetime, condition_era_start_date) as condition_era_start_datetime,
	convert(datetime, condition_era_end_date) as condition_era_end_datetime,
	condition_occurrence_count

into DatabaseSchemaCDMVersion6.condition_era
from DatabaseSchemaCDMVersion5.CONDITION_ERA
