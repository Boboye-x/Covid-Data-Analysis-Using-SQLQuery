SELECT *
FROM PorfolioProject..CovidData
WHERE continent IS NOT NULL
ORDER BY 3,4

--Select *
--From PorfolioProject..CovidData
--order by 3,4

SELECT continent, date, total_cases, new_cases, total_deaths, population
FROM PorfolioProject..CovidData
WHERE continent IS NOT NULL
ORDER BY 1,2

-- Total Cases Vs Total Deaths
-- Shows the likelihood of dying if you contract covid-19 in your country. For me, Africa. 

SELECT continent, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM PorfolioProject..CovidData
WHERE continent like '%frica%'
AND continent IS NOT NULL
ORDER BY 1,2

-- Looking at Total Cases Vs Population
-- Shows what percentage of population got Covid

SELECT continent, date, Population, total_cases, (total_cases/population)*100 AS PercentPopulationInfected
FROM PorfolioProject..CovidData
--WHERE Location like '%frica%'
AND continent IS NOT NULL
ORDER BY 1,2

--Looking at countries with highest Infection rate compared to Population

SELECT continent, Population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM PorfolioProject..CovidData
--WHERE Location like '%frica%'
AND continent IS NOT NULL
GROUP BY continent, Population
ORDER BY PercentPopulationInfected DESC 

-- Showing Countries with Highest Death Count per Population 

SELECT continent, MAX(cast(total_deaths AS INT)) AS TotalDeathCount
FROM PorfolioProject..CovidData
--WHERE Location like '%frica%'
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC

-- LET'S BREAK THINGS DOWN BY CONTINENT 

-- Showing the Continents with Ghest Death Count per Population 

SELECT continent, MAX(cast(total_deaths AS INT)) AS TotalDeathCount
FROM PorfolioProject..CovidData
--WHERE Location like '%frica%'
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC

-- GLOBAL NUMBERS 

SELECT SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS INT)) AS total_deaths, SUM(CAST(new_deaths AS INT))/ SUM(New_Cases)*100 AS DeathPercentage
FROM PorfolioProject..CovidData
WHERE continent IS NOT NULL
--GROUP BY date
ORDER BY 1,2

-- Assuming you had two tables and you wanted to JOIN them. This is how to go about it.
-- two tables = covidDeaths and CovidVaccinations

--SELECT *
--FROM PorfolioProject..CovidDeaths dea -- dea = alias
--JOIN PorfolioProject..CovidVaccinations vac -- vac = alias
--  ON dea.location = vac.location -- You have joined both tables on date and location.
--  ON dea.date = vac.date

