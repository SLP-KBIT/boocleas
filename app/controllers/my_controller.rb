class MyController < ApplicationController
  before_action :authenticate_user!
  def index
    @biblios = LentHistory.lent_to(current_user).map(&:biblio)
    @biblo_form = BiblioForm.new params[:biblio_form]
    @histories = LentHistory.personal_history(current_user.id)
  end
end
