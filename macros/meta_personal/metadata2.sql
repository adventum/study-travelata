{%- macro metadata2() -%}
{% set meta = {'entities' : [], 'links': []} %}

{%- do update_metadata(fromyaml(metadata_alexandra()), meta) -%}
{%- do update_metadata(fromyaml(metadata_dmitrii()), meta) -%}
{%- do update_metadata(fromyaml(metadata_alexandrazhar()), meta) -%}
{%- do update_metadata(fromyaml(metadata_petr()), meta) -%}
{%- do update_metadata(fromyaml(metadata_tatiana()), meta) -%}
{%- do update_metadata(fromyaml(metadata_ekaterina()), meta) -%}

{{ return(meta) }}

{%- endmacro -%}