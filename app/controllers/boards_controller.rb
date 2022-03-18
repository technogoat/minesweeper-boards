class BoardsController < ApplicationController
  before_action :set_board, only: %i[show]

  def home; end

  # GET /boards or /boards.json
  def index
    @pagy, @boards = pagy(Board.order(index_params), items: 20)
  end

  # GET /boards/1 or /boards/1.json
  def show; end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # POST /boards or /boards.json
  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to board_url(@board), notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def board_params
    params.require(:board).permit(:email, :name, :width, :height, :bombs)
  end

  def index_params
    "#{params[:sort_by] || 'created_at'} #{params[:direction] || 'desc'}"
  end
end
