require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:one)
  end

  test 'should get all boards' do
    get all_boards_url
    assert_response :success
  end

  test 'should get index' do
    get boards_url
    assert_response :success
  end

  test 'should get new' do
    get new_board_url
    assert_response :success
  end

  test 'should create board' do
    assert_difference('Board.count') do
      post boards_url,
           params: { board: { bombs: @board.bombs, email: @board.email, height: @board.height, name: @board.name,
                              width: @board.width, board_data: [[0, 0], [0, 1]] } }
    end

    assert_redirected_to board_url(Board.last)
  end

  test 'should create board ignoring unpermitted params' do
    assert_difference('Board.count') do
      post boards_url,
           params: { board: { bombs: @board.bombs, email: @board.email, height: @board.height, name: @board.name,
                              width: @board.width, board_data: [[0, 0], [0, 1]] } }
    end

    assert_redirected_to board_url(Board.last)
  end

  test 'should show board' do
    get board_url(@board)
    assert_response :success
  end

  test 'should get board grid' do
    get grid_board_url(@board)
    assert_response :success
  end
end
