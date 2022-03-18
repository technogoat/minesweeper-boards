class BoardsGeneratorJob < ApplicationJob
  queue_as :default

  def perform(board)
    board_generator = BoardGenerator.new(board.width, board.height, board.bombs)
    board_data = board_generator.generate
    board.update(board_data:)
  end
end
