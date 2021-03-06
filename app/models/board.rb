class Board < ApplicationRecord
  validates :name, presence: true
  validates :width, :height, presence: true,
                             numericality: { only_integer: true, greater_than_or_equal_to: 2 }

  validates :email, email: true,
                    presence: true

  validates :bombs, presence: true,
                    numericality: {
                      only_integer: true
                    },
                    comparison: { less_than_or_equal_to: proc { |b|
                                                           b.width * b.height
                                                         } },
                    unless: proc { |b| b.width.nil? || b.height.nil? }

  after_create_commit :generate_board
  after_update_commit :broadcast_grid, unless: proc { |b| b.board_data.nil? }

  private

  def generate_board
    BoardsGeneratorJob.perform_later(self)
  end

  def broadcast_grid
    Turbo::StreamsChannel.broadcast_replace_to "grid_#{id}", target: "grid_#{id}",
                                                             partial: 'boards/grid',
                                                             locals: { board: self }
  end
end
