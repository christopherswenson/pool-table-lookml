view: ball {
  sql_table_name: api_ball ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: kind {
    type: string
    sql: ${TABLE}.kind ;;
  }

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
