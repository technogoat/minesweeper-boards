class BoardGenerator
  def initialize(width, height, bombs_count)
    @board = { x: width - 1, y: height - 1 }
    @bombs_count = bombs_count
  end

  def generate
    bomb_data = generate_bomb_data
    generate_board(bomb_data)
  end

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
    existing_bombs = {}
    bomb_counter = 0

    while bomb_counter < @bombs_count
      x, y = random_x_y

      next if existing_bombs[x]&.include?(y)

      existing_bombs[x] = [] if existing_bombs[x].nil?
      existing_bombs[x] << y
      bomb_counter += 1
    end

    existing_bombs
  end

  private

  def random_x_y
    [rand(0..@board[:x]), rand(0..@board[:y])]
  end
end
