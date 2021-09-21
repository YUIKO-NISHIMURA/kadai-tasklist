class UsersController < ApplicationController
  before_action :required_user_logged_in, only:[:index, :show]
  def index
    @users = User.order(id: :desc)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "登録に成功しました"
      redirect_to @user
    else
      flash[:danger] = "登録に失敗しました"
      render :new
    end 
    
    
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end 
end
