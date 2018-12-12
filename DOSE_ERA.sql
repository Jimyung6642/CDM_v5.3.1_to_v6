select
	dose_era_id,
	person_id,
	drug_concept_id,
	unit_concept_id,
	dose_value,
	convert(datetime, dose_era_start_date) as dose_era_start_datetime,
	convert(datetime, dose_era_end_date) as dose_era_end_datetime

into @DatabaseSchemaCDMVersion6.dose_era
from @DatabaseSchemaCDMVersion5.DOSE_ERA
