class MyController < ApplicationController
  def index
    @biblios = LentHistory.lent_to(current_user).map(&:biblio)
  end
end
