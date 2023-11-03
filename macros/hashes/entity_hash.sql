{%- macro entity_hash(entity_name, metadata_dict, alias='') -%}
    {%- set entity_keys = metadata_dict['entities'][entity_name]['keys'] -%}

    {%- set all_cols = [] -%} {# сюда складываем ключи с трансформациями #}
    {%- set skip_null_cols = [] -%} {# skipInNullCheck #}

    {%- for key in entity_keys -%}
        {% set sql_string = 'toString({})'.format(key['name']) %}
        
        {%- if not key.get('notrim') -%}
            {% set sql_string = 'trim({})'.format(sql_string) %}
        {%- endif -%}
        {%- if not key.get('case-sensitive') -%}
            {%- set sql_string = 'upper({})'.format(sql_string) -%}
        {%- endif -%}

        {%- set sql_string = 'ifnull(nullif({}, \'\'), \'\')'.format(sql_string) -%}

        {%- if not key.get('skipInNullCheck') -%}
            {% set _ = skip_null_cols.append(sql_string) %}
        {%- endif -%}

        {%- set _ = all_cols.append(sql_string) -%}

    {%- endfor -%}

    {%- set all = ' || \';\' || '.join(all_cols) -%}
    {%- set skip_null = ' || '.join(skip_null_cols) -%}


    assumeNotNull(coalesce(if({{ skip_null }} = '', null, hex(MD5({{ all }}))))) as {% if (alias | length > 0) %}{{ alias }}{% else %}{{ entity_name }}{% endif %}Hash

{% endmacro %}