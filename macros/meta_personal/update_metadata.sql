{%- macro update_metadata(new, old) -%}

{%- do old.entities.append(new.entities) -%}
{%- do old.links.append(new.links) -%}

{%- endmacro -%}