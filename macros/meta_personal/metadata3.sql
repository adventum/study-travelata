{%- macro metadata3() -%}
{% set meta = {'entities' : [], 'links': []} %}

{%- do update_metadata(fromyaml(metadata_tatiana()), meta) -%}
{%- do update_metadata(fromyaml(metadata_dmitrii()), meta) -%}


{{ return(meta) }}

{%- endmacro -%}