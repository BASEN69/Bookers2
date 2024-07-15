class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def edit
    @user = User.find(params[:id])
  end


  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def index
    @book = Book.new
    @book.user_id = current_user.id

    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  #ユーザー本人のみアクセス可能にする
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
end
