#!/bin/sh

# Copy all json files that the scripts generate into the `data` dir.
# FROM covid19_nagano_csv_to_json
curl -o data/170003_ishikawa_covid19_city_town_patients.json https://raw.githubusercontent.com/kulvon/ishikawa_csv_to_json/master/data/170003_ishikawa_covid19_city_town_patients.json
curl -o data/170003_ishikawa_covid19_patients.json https://raw.githubusercontent.com/kulvon/covid-test/master/data/170003_ishikawa_covid19_patients.json
curl -o data/170003_ishikawa_covid19_test_count.json https://raw.githubusercontent.com/kulvon/covid-test/master/data/170003_ishikawa_covid19_test_count.json
curl -o data/contacts.json https://raw.githubusercontent.com/kulvon/covid-test/master/data/contacts.json
curl -o data/general_consultation.json https://raw.githubusercontent.com/kulvon/covid-test/master/data/general_consultation.json
curl -o data/news.json https://raw.githubusercontent.com/kulvon/covid-test/master/data/news.json
curl -o data/patients_summary.json https://raw.githubusercontent.com/kulvon/covid-test/master/data/patients_summary.json
