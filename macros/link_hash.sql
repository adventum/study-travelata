{%- macro link_hash(link_name, metadata_dict) -%}
    {%- set entities = metadata_dict['entities'] -%}
    {%- set links = metadata_dict['links'] -%}
    {%- set name_hash = "'" ~ link_name ~ "'" -%}

    {%- set link_entities = links[link_name]['entities'] -%} {# связанные линком хабы #}
    {%- set link_keys = links[link_name].get('keys') -%} {# доп. ключи для линка #}
    {%- set all_keys = [] -%}

    {%- for entity in link_entities -%}
        {%- set _ = all_keys.extend(entities[entity]['keys']) -%} {# собираем список ключей хабов #}
    {%- endfor -%}

    {%- if link_keys is not none -%}
        {%- set all_keys = all_keys + link_keys -%} {# добавляем к ключам хабов ключи линков #}
    {%- endif -%}

    {%- set all_cols = [name_hash] -%} {# сюда складываем ключи с трансформациями #}
    {%- set skip_null_cols = [] -%} {# skipInNullCheck #}

    {%- for key in all_keys -%}
        {%- set sql_string = 'toString({})'.format(key['name']) -%}
        
        {%- if not key.get('notrim') -%}
            {%- set sql_string = 'trim({})'.format(sql_string) -%}
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


    assumeNotNull(coalesce(if({{ skip_null }} = '', null, hex(MD5({{ all }}))))) as {{ link_name }}Hash
    
{%- endmacro -%}