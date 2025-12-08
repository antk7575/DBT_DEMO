{% macro function1(x) %}
    case when TO_TIMESTAMP({{x}}) < CURRENT_DATE THEN 'past' 
    else 'future' end
{% endmacro %}


{% macro get_season(x) %}
    CASE 
        WHEN MONTH(TO_TIMESTAMP({{x}})) in (12,1,2) THEN 'WINTER' 
        WHEN MONTH(TO_TIMESTAMP({{x}})) in (3,4,5) THEN 'SPRING'
        WHEN MONTH(TO_TIMESTAMP({{x}})) in (6,7,8) THEN 'SUMMER' 
        ELSE 'AUTUM' END 
{% endmacro %}

{% macro day_type(x) %}
    CASE 
    WHEN LOWER(DAYNAME(TO_TIMESTAMP({{x}}))) in ('sat', 'sun') THEN 'WEEKEND' 
    ELSE 'BUSINESSDAY' 
    END
{% endmacro %}
