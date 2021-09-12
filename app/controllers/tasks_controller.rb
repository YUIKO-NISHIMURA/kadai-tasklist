class TasksController < ApplicationController
before_action :set_task, only:[:edit, :show, :update, :destroy]

  def index
    @tasks = Task.all 
  end 
 
  def create 
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "Taskが追加されました"
      redirect_to @task 
    else 
      flash.now[:danger] = "Taskは追加されませんでした"
      render :new
    end 
    
  end
  
  def new
    @task = Task.new
  end
  
  def edit
  end 
  
  def show
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
  
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params 
    params.require(:task).permit(:content, :status)
  end 

end 