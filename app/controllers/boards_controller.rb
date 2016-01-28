class BoardsController < ApplicationController
  before_action :init_data, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:show, :edit, :update, :destroy]

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if current_user.boards.length == 4
      flash.now[:danger] = "You can't create more than 4 boards !"
      render :new
    else
      @board[:user_id] = current_user.id
      if @board.save
        flash[:success] = "Board \"#{@board.name}\" was created!"
        redirect_to root_path
      else
        flash.now[:danger] = "Error while creating board  \"#{@board.name}\""
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @board.update(board_params)
      flash[:success] = "Your board was updated!"
      redirect_to board_path(@board)
    else
      flash.now[:danger] = "Error while updating board  \"#{@board.name}\""
      render :edit
    end
  end

  def destroy
    if @board.destroy
      flash[:success] = "Your board was deleted !"
      redirect_to root_path
    else
      flash.now[:danger] = "Error while deleting board  \"#{@board.name}\""
      redirect_to root_path
    end
  end


  private

  def init_data
    @board = Board.find(params[:id])
  end

  def require_same_user
    if current_user != @board.user
      flash[:danger] = "You don't have enough permissions!"
      redirect_to root_path
    end
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
