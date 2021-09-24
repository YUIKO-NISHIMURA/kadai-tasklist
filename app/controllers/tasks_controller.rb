class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only:[:show, :edit, :update, :destroy]

  def index
    @task = current_user.tasks.all
  end 
 
  def create 
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = "Taskが追加されました"
      redirect_to tasks_url
    else 
      flash.now[:danger] = "Taskは追加されませんでした"
      render :new
    end 
    
  end
  
  def new
    @task = Task.new
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = "Taskが編集されました"
      redirect_to @task 
    else 
      flash.now[:danger] = "Taskは編集されませんでした"
      render :edit
    end 
  end 
  
  def destroy
    @task.destroy
    
    flash[:success] = "Taskは削除されました"
    redirect_to tasks_url
  end 

  private 
  #Strong Parameter

  def task_params 
    params.require(:task).permit(:content, :status)
  end 
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end 
  end 
end 