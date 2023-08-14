view: date {
  sql_table_name: sales.date ;;

  dimension_group: cy {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.cy_date ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: week_test {
    sql: WEEK(${TABLE}.date);;
    group_label: "Date Date"
    group_item_label: "Week Test"
  }
  dimension: day_test {
    hidden: yes
    sql: DAY(${TABLE}.date);;
    group_label: "Date Date"
    group_item_label: "Week Test"
  }

  dimension: month_name_test {
    hidden: yes
    sql: MONTHNAME(${TABLE}.date);;
    group_label: "Date Date"
    group_item_label: "Month Name Test"
  }


  dimension: week_string {
    type: string
    sql: CONCAT(CAST(${week_test} AS CHAR),' || Wk- ', CAST(ROUND((CONVERT(${day_test},DECIMAL)+6)/7) AS CHAR)) ;;
    group_label: "Date Date"
  }

  dimension: month_string {
    type: string
    sql: CONCAT(CAST(${month_name_test} AS CHAR),' || Wk- ', CAST(ROUND((CONVERT(${day_test},DECIMAL)+6)/7) AS CHAR)) ;;
    group_label: "Date Date"
  }

  dimension: month_year {
    type: string
    sql: CONCAT(CAST(${month_name_test} AS CHAR(3)),' ', CAST( YEAR(${TABLE}.date) AS CHAR)) ;;
    group_label: "Date Date"
  }

  dimension: another_test {
    type: string
    sql: CONCAT(CAST(${week_test} AS CHAR),' || Wk- ', CAST(ROUND((${day_test}+6)/7) AS CHAR)) ;;
    group_label: "Date Date"
  }


  dimension: date_yy_mmm {
    type: string
    sql: ${TABLE}.date_yy_mmm ;;
  }

  dimension: month_name {
    type: string
    sql: ${TABLE}.month_name ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [month_name]
  }
}
