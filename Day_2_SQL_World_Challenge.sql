use world;
SET SQL_SAFE_UPDATES=0;

#1 Using COUNT, get the number of cities in the USA
select count(ID) from city where countrycode = 'USA';

#2 Find out the population and life expectancy for people in Argentina.
select code, name, population, lifeexpectancy from country where code = 'ARG';

#3 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
select name, lifeexpectancy
from country 
where name is not null
order by lifeexpectancy desc
limit 1;

#4 Using JOIN ... ON, find the capital city of Spain.

select co.name,ci.name as 'Capital'
from country co
join city ci on co.capital = ci.id
where co.name = 'Spain';

#5 Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.

select distinct co.region,cl.language,cl.isofficial
from country co
join countrylanguage cl on co.code = cl.countrycode
where region = 'Southeast Asia' and isofficial = 'T'; #do I need "and isofficial = 'T'" at the end?

#6 Using a single query, list 25 cities around the world that start with the letter F.

select name from city where name like 'f%' limit 25;

#7 Using COUNT and JOIN ... ON, get the number of cities in China.

select count(ci.id)
from city ci
join country co on ci.countrycode = co.code
where co.name = 'China' and ci.name is not null;

#8 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.

select name, population from country
where population != 0
order by population asc
limit 1;

#9 Using aggregate functions, return the number of countries the database contains.

select count(code) from country;

#10 What are the top ten largest countries by area?

select name, surfacearea from country
order by surfacearea desc
limit 10;

#11 List the five largest cities by population in Japan.

select name, population from city
where countrycode = 'JPN'
order by population desc
limit 5;

#12 List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
#CODE TO UPDATE, first ran: 'SET SQL_SAFE_UPDATES=0;' then:
update country
set headofstate = 'Elizabeth II'
where headofstate = 'Elisabeth II';
#CODE TO RUN COMMAND
select name, code from country
where headofstate = 'Elizabeth II';
#select count(headofstate) from country where headofstate = 'Elizabeth II'; to check answer


#13 List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.

select name, population, surfacearea, population/surfacearea as pop_to_area_ratio
from country
where population != 0
order by pop_to_area_ratio asc
limit 10;

#14 List every unique world language.

select distinct language from countrylanguage
order by language asc;

#15 List the names and GNP of the world's top 10 richest countries.

select name, GNP from country
order by GNP desc
limit 10;

#16 List the names of, and number of languages spoken by, the top ten most multilingual countries.

select co.name, count(cl.language) from countrylanguage cl
join country co
on cl.countrycode = co.code
group by countrycode
order by count(language) desc limit 10;

#17 List every country where over 50% of its population can speak German.

select co.name, cl.language, cl.percentage
from countrylanguage cl
join country co on cl.countrycode = co.code
where language = 'German' and percentage > 50.0
order by percentage desc;

#18 Which country has the worst life expectancy? Discard zero or null values.

select name, lifeexpectancy
from country
where lifeexpectancy != 0 and lifeexpectancy is not null
order by lifeexpectancy asc
limit 1;

#19 List the top three most common government forms.

select governmentform, count(governmentform) from country
where governmentform is not null
group by governmentform
order by count(governmentform) desc limit 3;

#20 How many countries have gained independence since records began?

select count(indepyear) from country where indepyear is not null;

#---------------------------------------------------------------------
select * from city;
select * from country;
select * from countrylanguage;
