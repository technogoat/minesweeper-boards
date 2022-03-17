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

  after_create :generate_board
  after_create { broadcast_prepend_to('boards') }

  private

  def generate_board
    BoardsGeneratorJob.perform_later(self)
  end
end
