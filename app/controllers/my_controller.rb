class MyController < ApplicationController
  def index
    @biblios = LentHistory.lent_to(current_user).map(&:biblio)
    @biblo_form = BiblioForm.new params[:biblio_form]
  end
end
