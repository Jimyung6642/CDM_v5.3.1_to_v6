select	
	person_id,
	gender_concept_id,
	year_of_birth,
	month_of_birth,
	day_of_birth,
	convert(datetime, year_of_birth) as birth_datetime,
	convert(datetime, NULL) as death_datetime,
	race_concept_id,
	ethnicity_concept_id,
	location_id,
	provider_id,
	care_site_id,
	person_source_value,
	gender_source_value,
	gender_source_concept_id,
	race_source_value,
	race_source_concept_id,
	ethnicity_source_value,
	ethnicity_source_concept_id

into DatabaseSchemaCDMVersion6.person
from DatabaseSchemaCDMVersion5.PERSON 
where person_id not in (select person_id from DatabaseSchemaCDMVersion5.DEATH)

Insert into DatabaseSchemaCDMVersion6.dbo.person
select
	a.person_id,
	gender_concept_id,
	year_of_birth,
	month_of_birth,
	day_of_birth,
	convert(datetime, year_of_birth) as birth_datetime,
	convert(datetime, death_date) as death_datetime,
	race_concept_id,
	ethnicity_concept_id,
	location_id,
	provider_id,
	care_site_id,
	person_source_value,
	gender_source_value,
	gender_source_concept_id,
	race_source_value,
	race_source_concept_id,
	ethnicity_source_value,
	ethnicity_source_concept_id

from DatabaseSchemaCDMVersion5.PERSON a, DatabaseSchemaCDMVersion5.DEATH b
where a.person_id=b.person_id
