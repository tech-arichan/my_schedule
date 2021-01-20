class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :show]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_parameter)
    redirect_to tasks_path

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
    params.require(:task).permit(:title, :deadline, :detail, :priority_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
