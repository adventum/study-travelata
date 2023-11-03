{%- macro make_link(metadata_dict) %}
{% set link_name = this.name | replace('link_', '', 1) %}
{% set link_name_camel_case = link_name | replace('_', ' ') | title | replace(' ', '') %}
{% set link_keys = (metadata_dict['links'][link_name_camel_case].get('keys')) | map(attribute='name') %}
{% set group_by_fields = [] %}
{% set source_model_name = 'hash_' + (link_name | lower) %}
SELECT {% for c in adapter.get_columns_in_relation(load_relation(ref(source_model_name))) -%}
{% if c.name == link_name_camel_case + 'Hash' or c.name in link_keys | default([], True) %}{{ c.name }}
{%- do group_by_fields.append(c.name)  -%}
{%- elif 'Int' in c.data_type or 'Float' in c.data_type or 'Num' in c.data_type %}SUM({{ c.name }}) AS {{ c.name }}
{%- else %} MAX({{ c.name }}) AS {{ c.name }}
{%- endif %}{% if not loop.last %},{% endif %}{% endfor %} 
FROM {{ ref(source_model_name) }}
GROUP BY {{ group_by_fields | join(', ') }}
{% endmacro %}