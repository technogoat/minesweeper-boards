module BoardsHelper
  def sort_link(label:, sort_by: 'created_at')
    link_to(label, all_boards_path(sort_by:, direction: toggle_direction(sort_by), page: params[:page]),
            data: { turbo_action: 'advance' })
  end

  def toggle_direction(sort_by)
    if params[:sort_by] == sort_by
      params[:direction] == 'asc' ? 'desc' : 'asc'
    else
      'asc'
    end
  end

  def sort_indicator
    tag.span(class: "sort sort-#{params[:direction]}")
  end

  def grid_skeleton_axis(board_dimension)
    board_dimension > 50 ? 50 : board_dimension
  end
end
