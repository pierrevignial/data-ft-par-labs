SELECT *
FROM crime_scene_report
WHERE date = 20180115
AND city = 'SQL City'
AND type = 'murder';

description: Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".


SELECT *
FROM person
WHERE address_street_name = "Northwestern Dr"
ORDER BY address_number DESC;

witnesses: 14887, 111564949 and 16371, 318771143

SELECT *
FROM interview
WHERE person_id = 14887 OR person_id = 16371;

testimony 1:I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
testimony 2:I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

SELECT interview.transcript
FROM person
INNER JOIN drivers_license ON person.license_id = drivers_license.id
INNER JOIN get_fit_now_member ON person.id = get_fit_now_member.person_id
INNER JOIN get_fit_now_check_in ON get_fit_now_check_in.membership_id = get_fit_now_member.id
INNER JOIN interview ON person.id = interview.person_id
WHERE membership_status = 'gold'
AND person.name = 'Jeremy Bowers'
ORDER BY get_fit_now_member.id

SELECT person.name, income.annual_income, facebook_event_checkin.event_name, facebook_event_checkin.date
FROM person
INNER JOIN drivers_license ON person.license_id = drivers_license.id
INNER JOIN income ON income.ssn = person.ssn
JOIN facebook_event_checkin ON facebook_event_checkin.person_id = person.id
WHERE hair_color = 'red'
AND car_make = 'Tesla'
AND car_model = 'Model S';

Miranda Priestly
