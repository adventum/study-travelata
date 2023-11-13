{%- macro graph_tuples(metadata_dict, schema) -%}
    {%- set glue_models = metadata_dict['glue_models'] -%}

    {%- for table, data in glue_models.items() -%}
        {% set cols = data['cols'] %}
        {% set datetime_field = data['datetime_field'] %}
        {%- set query = '' -%}

        {%- if not loop.first %}
            {{ query ~ 'union all' }}
        {% endif -%}

        {%- for col in cols[1:] -%}

            {%- if not loop.first %}
                {{ query ~ 'union all' }}
            {% endif -%}
            {%- set tmp -%}
                select
                    tuple(toLowCardinality('{{ cols[0] }}'), {{ datetime_field }},  {{ cols[0] }}) as hash,
                    tuple(toLowCardinality('{{ col }}'), toDateTime(0),  {{ col }}) as node_left
                from {{ schema }}.{{ table }}
                where nullIf({{ col }}, '') is not null
            {%- endset -%}
            
            {{ query ~ tmp }}
        {%- endfor -%}
    {%- endfor -%}
{%- endmacro -%}

