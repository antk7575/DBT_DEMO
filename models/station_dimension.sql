{{
    config(
        materialized='table'
    )
}}


WITH BIKE AS (

SELECT 
DISTINCT
START_STATION_ID, 
START_STATION_NAME, 
START_LAT, 
START_LNG
FROM 
{{ source('demo', 'bike') }} 
)
SELECT 
* 
FROM BIKE