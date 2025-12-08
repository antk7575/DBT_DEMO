WITH CTE AS (

SELECT
TO_TIMESTAMP(STARTED_AT) AS started_at, 
date(TO_TIMESTAMP(STARTED_AT)) as date_started_at,
HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT, 
{{day_type('STARTED_AT')}} as day_type, 
{{get_season('STARTED_AT')}} AS STATION_OF_YEAR

FROM {{ source('demo', 'bike') }}

)

SELECT 
* 
FROM CTE