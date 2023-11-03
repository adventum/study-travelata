{%- macro make_hub() %}
{% set hub_name = this.name | replace('hub_', '', 1) %}
SELECT DISTINCT ON ({{ hub_name | replace('_', ' ') | title | replace(' ', '') }}Hash) *
FROM {{ ref('hash_' + hub_name) }}
{% endmacro %}