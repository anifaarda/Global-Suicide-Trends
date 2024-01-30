select * from suicide_rate;

-- 1. TOTAL NUMBERS OF SUICIDE RECORDED
select sum(`suicides_no`) as total_suicides_numbers
from suicide_rate
where year >= 2010;

select (sum(`suicides_no`)/sum(population)) as total_suicides_rates
from suicide_rate
where year >= 2010;

-- 2. SUICIDE RATE BY THE GENDER
select sex, sum(`suicides_no`) as `suicides_numbers`
from suicide_rate
where year >= 2010
group by sex;

-- 3. AVERAGE SUICIDES PER YEAR
select year, avg(`suicides_no`) as avg_suicides_numbers
from suicide_rate
where year >= 2010
group by year
order by year;

-- 4. AVERAGE SUICIDES NUMBER PER COUNTRY
select country, avg(`suicides_no`) as avg_suicides_numbers
from suicide_rate
where year >= 2010
group by country
order by avg_suicides_numbers desc
limit 5;

-- 5. COMPARING THE SUICIDE RATE BY THE GENERATION
select generation, age, sum(`suicides_no`) as suicides_numbers
from suicide_rate
where year >= 2010
group by generation, age
order by suicides_numbers desc;

-- 6. CORRELATION BETWEEN GDP PER CAPITA WITH THE SUICIDES RATE
select `gdp_per_capita ($)`, avg(suicides_no) as suicides_numbers
from suicide_rate
where year>=2010
group by `gdp_per_capita ($)`
order by suicides_numbers desc;

-- 7. CORRELATION BETWEEN POPULATION DENSITY WITH THE SUICIDES RATE
select country, sum(population) as population, avg(`suicides_no`) as `avg_suicides_numbers`
from suicide_rate
where year >=2010
group by country
order by `avg_suicides_numbers` desc ;

-- 8. YEARLY SUICIDES NUMBERS BY COUNTRY
select year, country, avg(`suicides_no`) as `avg_suicides_numbers`
from suicide_rate
where year>=2010
group by country, year
order by year asc;
