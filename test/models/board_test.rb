require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper
  test 'valid board' do
    board = boards(:one)
    assert board.valid?
  end

  test 'invalid board' do
    board = Board.new
    refute board.valid?, 'board is valid without a required params'
    assert_not_nil board.errors[:name], 'no validation error for name present'
    assert_not_nil board.errors[:email], 'no validation error for email present'
    assert_not_nil board.errors[:width], 'no validation error for width present'
    assert_not_nil board.errors[:height], 'no validation error for height present'
    assert_not_nil board.errors[:bombs], 'no validation error for bombs present'
  end

  test 'invalid board with more bombs than cells' do
    board = Board.new(name: 'board', email: 'test@test.org', width: 3, height: 3, bombs: 11)
    refute board.valid?, 'board is valid with more bombs than cells'
    assert_equal('must be less than or equal to 9', board.errors.messages[:bombs][0])
  end

  test 'generates board data' do
    board = Board.create!(name: 'board', email: 'test@test.org', width: 3, height: 3, bombs: 2)
    perform_enqueued_jobs
    assert_not_nil board.reload.board_data
  end
end
