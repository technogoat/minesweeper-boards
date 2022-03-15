json.extract! board, :id, :email, :name, :width, :height, :bombs, :created_at, :updated_at
json.url board_url(board, format: :json)
