{% macro calc_graph(schema) %} 
    {% set right_query %}
            create or replace table {{ schema }}.graph_right engine=Log() as
            with
            min_group_id as (
                select
                    node_id_left,
                    min(group_id) as min_group_id
                from {{ schema }}.graph_edge
                group by node_id_left
            )

            select
                node_id_left,
                node_id_right,
                min_group_id as group_id,
                min_group_id != e.group_id as has_changed
            from {{ schema }}.graph_edge e
            join min_group_id r on r.node_id_left = e.node_id_left
    {% endset %}

    {% set left_query %}
            create or replace table {{ schema }}.graph_edge engine=Log() as
            with
            min_group_id as (
                select
                    node_id_right,
                    min(group_id) as min_group_id
                from {{ schema }}.graph_right
                group by node_id_right
            )

            select
                node_id_left,
                node_id_right,
                min_group_id as group_id,
                min_group_id != e.group_id as has_changed
            from {{ schema }}.graph_right e
            join min_group_id r on r.node_id_right = e.node_id_right
    {% endset %}

    {% set check_changed %}
        select 
            max(has_changed) 
        from {{ schema }}.graph_edge
    {% endset %}


    {% if execute %}
        {% set ns = namespace(check_change=1) %}
            {% for i in range(0, 14) %}
            {{ log("Running iteration " ~ i) }}
            {{ check_change }}
                {% if ns.check_change == 1 %}
                    {% do run_query(right_query) %}
                    {% do run_query(left_query) %}
                    {% set ns.check_change = run_query(check_changed).rows[0][0] %}
                    {{ log('VALUE: ' ~ ns.check_change) }}
                {% endif %}
            {% endfor %}
    {% endif %}
{% endmacro %}
