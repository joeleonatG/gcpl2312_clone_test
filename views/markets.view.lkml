view: markets {
  sql_table_name: sales.markets ;;

  dimension: markets_code {
    type: string
    sql: ${TABLE}.markets_code ;;
    html:
    {% if markets.zone._value == 'South' %}
    <p style="color: white; background-color: green; font-size:100%; text-align:center;">{{ rendered_value }}</p>
    {% elsif markets.zone._value == 'Central' %}
    <p style="color: white; background-color: black; font-size:100%; text-align:center;">{{ rendered_value }}</p>
    {% elsif markets.zone._value == 'North' %}
    <p style="color: black; background-color: red; font-size:100%; text-align:center;">{{ rendered_value }}</p>
    {% else %}
    <p>{{rendered_value}}</p>
    {% endif %}
    ;;
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
    link: {
      label: "Google Zone"
      url: "http://www.google.com/search?q={{ markets.zone._value }}"
    }
  }

  dimension: markets_name {
    type: string
    sql: ${TABLE}.markets_name ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }

  measure: count {
    type: count
    drill_fields: [markets_name]
  }
}
