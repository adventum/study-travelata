{% macro extract_utm_data(column_name, utm_name) -%}

    regexp_extract({{ column_name }}, 'utm_' || '{{ utm_name }}' || '=([^&]+)') as utm_{{ utm_name }}

{%- endmacro -%}