view: ballpocketed {
  sql_table_name: api_ballpocketed ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ball_id {
    type: number
    sql: ${TABLE}.ball_id ;;
  }

  dimension: is_called {
    type: yesno
    sql: ${TABLE}.is_called ;;
  }

  dimension: is_slop {
    type: yesno
    sql: ${TABLE}.is_slop ;;
  }

  dimension: pocket_id {
    type: number
    sql: ${TABLE}.pocket_id ;;
  }

  dimension: shot_id {
    type: number
    sql: ${TABLE}.shot_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
