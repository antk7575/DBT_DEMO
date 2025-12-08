WITH daily_weather AS ( 

SELECT 
DATE(time) as daily_weather, 
weather, 
temp, 
pressure, 
humidity, 
clouds
FROM {{ source('demo', 'weather') }}
), 

daily_weather_agg as (

select 
daily_weather, 
weather, 
round(avg(temp),2), 
round(avg(pressure),2),
round(avg(humidity),2), 
round(avg(clouds),2)
from daily_weather
group by daily_weather, weather
QUALIFY ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) DESC) = 1
ORDER BY daily_weather
)


SELECT * 
FROM daily_weather_agg