class CommentsController < ApplicationController
  before_action :init_data, only: [:new, :create, :destroy]
  before_action :require_same_user, only: [:new, :create, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @task.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment was added"
      redirect_to :back
    else
      flash[:danger] = "Error while creating comment"
      redirect_to :back, :flash => { :errors => @comment.errors.full_messages.to_json}
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "Your comment was deleted !"
      redirect_to :back
    else
      flash.now[:danger] = "Error while deleting comment"
      redirect_to :back
    end
  end

  private

  def init_data
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:task_id, :content)
  end

  def require_same_user
    if current_user != @task.board.user
      flash[:danger] = "You don't have enough permissions!"
      redirect_to root_path
    end
  end
end
