
--wordwide data
select *
from hussainportforlio.dbo.vaccination
--order by 1,2

 --looking at covid data in africa
select location, date, population, total_cases, new_cases, total_deaths
from  hussain.dbo.COVIDDEATH
where continent = 'africa'
order by 1,2


--total cases in africa countries
select location, sum(cast(new_cases as float)) as totalcases
from  hussain.dbo.COVIDDEATH
where continent = 'africa'
group by location
order by 1 desc


--total deaths in africa countries
select location, sum(cast(total_deaths as float)) as totaldeaths
from  hussain.dbo.COVIDDEATH
where continent = 'africa'
group by location
order by 1,2 desc

--the worst affected country in africa (infection)
select location, sum(cast(new_cases as float)) as totalcases
from  hussain.dbo.COVIDDEATH
where continent = 'africa'
group by location
order by totalcases desc

--countries with highest death count in africa
select location, sum(cast(new_deaths as float)) as totaldeaths
from  hussain.dbo.COVIDDEATH
where continent = 'africa'
group by location
order by totaldeaths desc

--looking at total cases vs toal deaths
-- likelihood of dying if conctact covid in africa

select location, date, total_cases, total_deaths,  (cast(total_deaths as float)/cast(total_cases as float))*100 as percentagedeath
from  hussain.dbo.COVIDDEATH
where continent = 'africa'
order by 1,2

--looking at total cases vs population 
--percentage of popultion contact covid

select location, date, population, total_cases,  (total_cases/population)*100  as populationinfectedpercentage
from  hussain.dbo.COVIDDEATH
where continent = 'africa'
order by 1,2

--looking at  country in africa  with the highest infection rate compare to population

select location, population, sum(cast(new_cases as float)) as highestinfectioncount,  (sum(cast(new_cases as float))/population )*100  as populationinfectedpercentage
from  hussain.dbo.COVIDDEATH
where continent = 'africa'
group by location,population
order by populationinfectedpercentage desc


--showing countries in africa with the higest death count per population

select location, population, sum(new_deaths) as highestDeathioncount,  (sum(new_deaths)/population)*100  as populationdeathpercentage
from  hussain.dbo.COVIDDEATH
where continent = 'africa'
group by location,population
order by populationdeathpercentage desc


