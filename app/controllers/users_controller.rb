class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user
  before_action :admin_only!
  def index
    @users = User.all
  end
  def edit
  end
  def update
    if current_user.id == params[:id].to_i
      flash[:error] = "自身の権限は変更できません。"
      redirect_to users_path and return
    end
    @user = nil unless @user.update_attributes(user_params)
    unless @user
      flash[:error] = "ユーザ情報を変更できませんでした。"
      redirect_to edit_user_path(params[:id]) and return
    end
    flash[:success] = "ユーザ情報を変更しました。"
    redirect_to users_path and return
  end

  private

  def get_user
    @user = User.where(id: params[:id]).first if params[:id]
  end

  def user_params
    params.require(:user).permit(%i(is_admin is_lendable))
  end
end
