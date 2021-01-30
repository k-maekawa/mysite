class UsersController < ApplicationController
before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
before_action :correct_user,   only: [:edit, :update]
before_action :admin_user,     only: :destroy
before_action :check_guest, only: [:update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

def create
  @user = User.new(user_params)
  if @user.save
    log_in @user
    flash[:success] = "SKILL HOUSEの世界へようこそ！"
    redirect_to @user
  else
    render 'new'
  end
end

def edit
  @user = User.find(params[:id])
end

def index
  @users = User.paginate(page: params[:page])
end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:success] = "更新が完了しました"
    redirect_to @user
  else
    render 'edit'
  end
end

def destroy
  User.find(params[:id]).destroy
  flash[:success] = "ユーザーを削除しました"
  redirect_to users_url
end

private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # before
  def logged_in_user
   unless logged_in?
     store_location
     flash[:danger] = "ログインしてください"
     redirect_to login_url
   end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def check_guest
    if @user.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。'
    end
  end
end