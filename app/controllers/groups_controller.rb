class GroupsController < ApplicationController
  before_action :get_group
  def index
    @groups = Group.order(:id).all
  end
  def edit

  end
  def update
    unless @group.update_attributes(group_params)
      flash[:error] = "変更に失敗しました。"
      redirect_to edit_group_path(@group) and return
    end
    flash[:success] = "変更しました。"
    redirect_to groups_path and return
  end

  private

  def get_group
    @group = Group.where(id: params[:id]).first if params[:id]
  end

  def group_params
    params.require(:group).permit(:name, :max_lent_week)
  end
end
