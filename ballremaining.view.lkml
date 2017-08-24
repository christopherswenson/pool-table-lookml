view: ballremaining {
  sql_table_name: api_ballremaining ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: ball_id {
    type: string
    sql: ${TABLE}.ball_id ;;
  }

  dimension: shot_id {
    type: string
    sql: ${TABLE}.shot_id ;;
  }

  set: detail {
    fields: [id, ball_id, shot_id]
  }
}
