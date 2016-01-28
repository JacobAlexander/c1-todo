class TasksController < ApplicationController
  before_action :init_data, only: [:index, :create, :show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:show, :create, :edit, :update, :destroy]

  def index
  end

  def new
    @task = Task.new
  end

  def create
    @board = Board.find(params[:board_id])
    @task = @board.tasks.create(task_params)
    if @task.save
      flash[:success] = "Task was created!"
      redirect_to board_path(@board)
    else
      flash.now[:danger] = "Error while creating task  #{@task.content}"
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "Your task was updated!"
      redirect_to :back
    else
      flash.now[:danger] = "Error while updating task"
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = "Your task was deleted !"
      redirect_to :back
    else
      flash.now[:danger] = "Error while deleting task"
      redirect_to :back
    end
  end

  def mark_task_as_finished
    @task = Task.find(params[:task_id])
    mark = params[:mark]

    if mark === 'finished'
      if @task.update(:finished => 1)
        flash[:success] = "Task marked as finished!"
      else
        flash[:danger] = "Error while marking task as finished"
      end
      redirect_to :back
    elsif mark === 'unfinished'
      if @task.update(:finished => 0)
        flash[:success] = "Task marked as unfinished!"
      else
        flash[:danger] = "Error while marking task as unfinished"
      end
      redirect_to :back
    end

  end

  private

  def init_data
    @board = Board.find(params[:board_id])
  end

  def require_same_user
    if current_user != @board.user
      flash[:danger] = "You don't have enough permissions!"
      redirect_to root_path
    end
  end

  def task_params
    params.require(:task).permit(:content)
  end
end