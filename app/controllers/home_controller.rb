class HomeController < ApplicationController

  def index
    @finished_tasks = current_user.tasks.where(finished: true).order("updated_at DESC").limit(10)
  end
end
