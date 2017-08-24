view: game {
  sql_table_name: api_game ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: ended {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ended_at ;;
  }

  dimension_group: started {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.started_at ;;
  }

  dimension: duration_seconds {
    type: number
    sql: TIMESTAMPDIFF(SECOND, ${TABLE}.started_at, ${TABLE}.ended_at) ;;
  }

  dimension: duration_days {
    type: number
    sql: (${duration_seconds} / 86400.0) ;;
    value_format: "mm:ss"
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
