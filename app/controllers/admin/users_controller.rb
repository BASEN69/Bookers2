class Admin::UsersController < ApplicationController

  
  def destroy
    @user.find(params[:id])
    @user.destroy
    redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました'
  end
end
