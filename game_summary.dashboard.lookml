- dashboard: game_summary
  title: Game Summary
  layout: newspaper
  embed_style:
    background_color: "#f6f8fa"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - name: Game Summary
    type: text
    title_text: Game Summary
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Balls Remaining by Shot Number
    title: Balls Remaining by Shot Number
    model: pool_shenanigans
    explore: shot
    type: looker_line
    fields:
    - shot.number_in_game
    - ballremaining.count
    - ball.kind
    pivots:
    - ball.kind
    filters:
      game.id: '1'
    sorts:
    - ballremaining.count desc 0
    - ball.kind
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: eight
      label: Eight
      expression: pivot_index(${ballremaining.count}, 1)
      value_format:
      value_format_name:
      _kind_hint: supermeasure
    - table_calculation: solid
      label: Solid
      expression: pivot_index(${ballremaining.count}, 2)
      value_format:
      value_format_name:
      _kind_hint: supermeasure
    - table_calculation: stripe
      label: Stripe
      expression: pivot_index(${ballremaining.count}, 3)
      value_format:
      value_format_name:
      _kind_hint: supermeasure
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: circle_outline
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - ballremaining.count
    series_types: {}
    listen:
      game_id: game.id
    row: 8
    col: 0
    width: 9
    height: 8
  - name: Winner
    title: Winner
    model: pool_shenanigans
    explore: gameplayer
    type: single_value
    fields:
    - player.first_name
    filters:
      game.id: '1'
      gameplayer.is_winner: 'Yes'
    sorts:
    - player.first_name
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    single_value_title: Winner
    listen:
      game_id: game.id
    row: 2
    col: 0
    width: 12
    height: 2
  - name: Loser
    title: Loser
    model: pool_shenanigans
    explore: gameplayer
    type: single_value
    fields:
    - player.first_name
    filters:
      game.id: '1'
      gameplayer.is_winner: 'No'
    sorts:
    - player.first_name
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    single_value_title: Loser
    listen:
      game_id: game.id
    row: 2
    col: 12
    width: 12
    height: 2
  - name: Loser Shots Taken
    title: Loser Shots Taken
    model: pool_shenanigans
    explore: shot
    type: single_value
    fields:
    - shot.count
    filters:
      game.id: '1'
      gameplayer.is_winner: 'No'
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Shots Taken
    listen:
      game_id: game.id
    row: 4
    col: 15
    width: 3
    height: 2
  - name: Winner Pattern
    title: Winner Pattern
    model: pool_shenanigans
    explore: gameplayer
    type: single_value
    fields:
    - gameplayer.pattern
    filters:
      game.id: '1'
      gameplayer.is_winner: 'Yes'
    sorts:
    - gameplayer.pattern
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: pattern_plural
      label: Pattern Plural
      expression: concat(${gameplayer.pattern}, "s")
      value_format:
      value_format_name:
      _kind_hint: dimension
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    single_value_title: Pattern
    hidden_fields:
    - gameplayer.pattern
    listen:
      game_id: game.id
    row: 4
    col: 0
    width: 3
    height: 2
  - name: Loser Pattern
    title: Loser Pattern
    model: pool_shenanigans
    explore: gameplayer
    type: single_value
    fields:
    - gameplayer.pattern
    filters:
      game.id: '1'
      gameplayer.is_winner: 'No'
    sorts:
    - gameplayer.pattern
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: pattern_plural
      label: Pattern Plural
      expression: concat(${gameplayer.pattern}, "s")
      value_format:
      value_format_name:
      _kind_hint: dimension
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    single_value_title: Pattern
    hidden_fields:
    - gameplayer.pattern
    listen:
      game_id: game.id
    row: 4
    col: 12
    width: 3
    height: 2
  - name: Loser Scratches
    title: Loser Scratches
    model: pool_shenanigans
    explore: shot
    type: single_value
    fields:
    - shot.count
    filters:
      game.id: '1'
      gameplayer.is_winner: 'No'
      shot.is_scratch: 'Yes'
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Scratches
    listen:
      game_id: game.id
    row: 4
    col: 18
    width: 3
    height: 2
  - name: Loser Shot Percentage
    title: Loser Shot Percentage
    model: pool_shenanigans
    explore: shot
    type: single_value
    fields:
    - shot.percentage
    filters:
      game.id: '1'
      gameplayer.is_winner: 'No'
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Shot Percentage
    listen:
      game_id: game.id
    row: 4
    col: 21
    width: 3
    height: 2
  - name: Winner Scratches
    title: Winner Scratches
    model: pool_shenanigans
    explore: shot
    type: single_value
    fields:
    - shot.count
    filters:
      game.id: '1'
      gameplayer.is_winner: 'Yes'
      shot.is_scratch: 'Yes'
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Scratches
    listen:
      game_id: game.id
    row: 4
    col: 6
    width: 3
    height: 2
  - name: Winner Shots Taken
    title: Winner Shots Taken
    model: pool_shenanigans
    explore: shot
    type: single_value
    fields:
    - shot.count
    filters:
      game.id: '1'
      gameplayer.is_winner: 'Yes'
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Shots Taken
    listen:
      game_id: game.id
    row: 4
    col: 3
    width: 3
    height: 2
  - name: Winner Shot Percentage
    title: Winner Shot Percentage
    model: pool_shenanigans
    explore: shot
    type: single_value
    fields:
    - shot.percentage
    filters:
      game.id: '1'
      gameplayer.is_winner: 'Yes'
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Shots Percentage
    listen:
      game_id: game.id
    row: 4
    col: 9
    width: 3
    height: 2
  - name: Game Progression
    type: text
    title_text: Game Progression
    row: 6
    col: 0
    width: 24
    height: 2
  - name: Number of Turns
    title: Number of Turns
    model: pool_shenanigans
    explore: shot
    type: single_value
    fields:
    - turn.count
    filters:
      game.id: '1'
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Number of Turns
    listen:
      game_id: game.id
    row: 8
    col: 14
    width: 5
    height: 2
  - name: Average Turn Length
    title: Average Turn Length
    model: pool_shenanigans
    explore: shot
    type: single_value
    fields:
    - game.id
    - shot.count
    - turn.count
    filters:
      game.id: '1'
    sorts:
    - shot.count desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: average_turn_length
      label: Average Turn Length
      expression: "${shot.count} / ${turn.count}"
      value_format:
      value_format_name:
      _kind_hint: measure
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - game.id
    - shot.count
    - turn.count
    series_types: {}
    value_format: 0.0 "Shots"
    single_value_title: Average Turn Length
    listen:
      game_id: game.id
    row: 8
    col: 9
    width: 5
    height: 2
  - name: Duration
    title: Duration
    model: pool_shenanigans
    explore: game
    type: single_value
    fields:
    - game.duration_days
    filters:
      game.id: ''
    sorts:
    - game.duration_days desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    value_format: m:ss
    single_value_title: Duration (m:ss)
    listen:
      game_id: game.id
    row: 8
    col: 19
    width: 5
    height: 2
  - name: Shot Success by Shot Number per Player
    title: Shot Success by Shot Number per Player
    model: pool_shenanigans
    explore: shot
    type: looker_area
    fields:
    - shot.number_in_game
    - shot.percentage
    - player.first_name
    pivots:
    - player.first_name
    filters:
      game.id: '1'
    sorts:
    - shot.percentage desc 0
    - player.first_name
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: step-after
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    trend_lines:
    - color: "#187fae"
      label_position: right
      period: 7
      regression_type: linear
      series_index: 1
      show_label: false
    - color: "#208f06"
      label_position: right
      period: 7
      regression_type: linear
      series_index: 2
      show_label: false
    series_types: {}
    listen:
      game_id: game.id
    row: 10
    col: 9
    width: 7
    height: 6
  - name: Balls Remaining by Shot Number and Player
    title: Balls Remaining by Shot Number and Player
    model: pool_shenanigans
    explore: shot
    type: looker_line
    fields:
    - shot.number_in_game
    - ballremaining.count
    - player.first_name
    pivots:
    - player.first_name
    filters:
      game.id: '1'
    sorts:
    - ballremaining.count desc 0
    - player.first_name
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: both
      label: Both
      expression: pivot_index(if(is_null(${ballremaining.count}), 0, ${ballremaining.count}),
        1) + pivot_index(if(is_null(${ballremaining.count}), 0, ${ballremaining.count}),
        2)
      value_format:
      value_format_name:
      _kind_hint: supermeasure
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: circle_outline
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    series_types: {}
    discontinuous_nulls: true
    series_colors:
      both: "#d1d1d1"
      Tyler - ballremaining.count: "#f0ab46"
      Christopher - ballremaining.count: "#d91e78"
    listen:
      game_id: game.id
    row: 10
    col: 16
    width: 8
    height: 6
  filters:
  - name: game_id
    title: game_id
    type: field_filter
    default_value: '1'
    model: pool_shenanigans
    explore: game
    field: game.id
    listens_to_filters: []
    allow_multiple_values: true
    required: false
