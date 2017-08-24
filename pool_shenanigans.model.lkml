connection: "pool_shenanigans_dev"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: ballpocketed {}

explore: game {
  join: gameplayer {
    relationship: one_to_many
    sql_on: ${gameplayer.game_id} = ${game.id} ;;
  }
}

explore: gameplayer {
  join: player {
    relationship: many_to_one
    sql_on: ${gameplayer.player_id} = ${player.id} ;;
  }
}

explore: player {}

explore: shot {
  join: turn {
    relationship: one_to_many
    sql_on: ${turn.id} = ${shot.turn_id};;
  }

  join: gameplayer {
    relationship: many_to_one
    sql_on: ${turn.player_id} = ${gameplayer.player_id} ;;
  }

  join: player {
    relationship: one_to_one
    sql_on: ${gameplayer.player_id} = ${player.id} ;;
  }

  join: ballremaining {
    relationship: one_to_many
    sql_on: ${shot.id} = ${ballremaining.shot_id} ;;
  }

  join: ball {
    relationship: one_to_many
    sql_on: ${ball.id} = ${ballremaining.ball_id} ;;
  }

  join: game {
    relationship: many_to_one
    sql_on: ${game.id} = ${turn.game_id} ;;
  }
}

explore: turn {}
