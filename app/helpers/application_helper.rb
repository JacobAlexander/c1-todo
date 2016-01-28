module ApplicationHelper

  def user_boards
    logged_in? ? current_user.boards : nil
  end
  def user_have_boards?
    logged_in? ? !current_user.boards.empty? : false
  end


  def task_class_current_status(param)
    case param
      when 1
        ' task-finished'
    end
  end

  def task_class_mark_current_status(param)
    case param
      when 1
        ' current-status-marked'
      else
        ' current-status-normal'
    end
  end
end
