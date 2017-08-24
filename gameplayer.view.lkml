view: gameplayer {
  sql_table_name: api_gameplayer ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: game_id {
    type: number
    sql: ${TABLE}.game_id ;;
  }

  dimension: is_winner {
    type: yesno
    sql: ${TABLE}.is_winner ;;
  }

  dimension: pattern {
    type: string
    sql: ${TABLE}.pattern ;;
  }

  dimension: player_id {
    type: number
    sql: ${TABLE}.player_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
