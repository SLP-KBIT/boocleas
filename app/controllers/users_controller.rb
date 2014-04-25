class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user
  def index
    @users = User.all
  end
  def edit
  end
  def update
    @user = nil unless @user.update_attributes(user_params)
    unless @user
      flash[:error] = "ユーザ情報を変更できませんでした。"
      redirect_to edit_user_path(params[:id])
    end
    flash[:success] = "ユーザ情報を変更しました。"
    redirect_to users_path
  end

  private

  def get_user
    @user = User.where(id: params[:id]).first if params[:id]
  end

  def user_params
    params.require(:user).permit(%i(is_admin is_lendable))
  end
end
