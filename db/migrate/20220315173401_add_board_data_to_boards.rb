class AddBoardDataToBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :boards, :board_data, :string, array: true
  end
end
