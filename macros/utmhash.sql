{% macro get_utmhash(delimiter, fields=['adGroupName', 'utmContent', 'utmCampaign', 'adCampaignName']) -%}
{% if fields | length > 1 %}greatest({% endif %}{% for field in fields -%}
  coalesce(extract({{ field }}, '{{delimiter}}([a-zA-Z0-9]{4})'), ''){% if not loop.last %}, {% endif %}
{%- endfor %}{% if fields | length > 1 %}){% endif %}
{%- endmacro %}