class BoardGenerator
  def initialize(width, height, bombs_count)
    @board = { x: width - 1, y: height - 1 }
    @bombs_count = bombs_count
  end

  def generate
    bomb_data = generate_bomb_data
    generate_board(bomb_data)
  end

  private

  def generate_board(bomb_data)
    board = Array.new(@board[:x] + 1) { Array.new(@board[:y] + 1, 0) }

    bomb_data.each do |x, y_data|
      y_data.each do |y|
        board[x][y] = 1
      end
    end

    board
  end

  def generate_bomb_data
    bomb_counter = 0
    bombs = {}
    board = Array.new(@board[:x] + 1) { |x| Array.new(@board[:y] + 1) { |y| { x:, y: } } }

    while bomb_counter < @bombs_count
      x_i = rand(0..board.length - 1)
      y_i = rand(0..board[x_i].length - 1)

      bombs[board[x_i][y_i][:x]] = [] if bombs[board[x_i][y_i][:x]].nil?
      bombs[board[x_i][y_i][:x]] << board[x_i][y_i][:y]

      board[x_i].delete_at(y_i)
      board.delete_at(x_i) if board[x_i].empty?

      bomb_counter += 1
    end

    bombs
  end
end
