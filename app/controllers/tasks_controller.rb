class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :show]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_parameter)
    if task.save
      redirect_to tasks_path
    else
      redirect_to new_task_path
    end
  end


  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_path
  end

  def edit
  end

  def update
    task = Task.find(params[:id])
    task.update(task_parameter)
    redirect_to tasks_path
  end

  def show
  end

  private

  def task_parameter
    params.require(:task).permit(:title, :deadline, :detail, :priority_id).merge(user_id: current_user.id)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
