{% macro get_adsourcedirty(utm_source='utmSource', utm_medium='utmMedium') -%}
lower(if(length({{ utm_source }}) > 0, concat({{ utm_source }}, ' / ', {{ utm_medium }}), null))
{%- endmacro %}