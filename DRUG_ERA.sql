select 
	drug_era_id,
	person_id,
	convert(datetime, drug_era_start_date) as drug_era_start_datetime,
	convert(datetime, drug_era_end_date) as drug_era_end_datetime,
	drug_exposure_count,
	gap_days

into DatabaseSchemaCDMVersion6.drug_era
from DatabaseSchemaCDMVersion5.DRUG_ERA
