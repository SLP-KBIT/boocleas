class LentHistoriesController < ApplicationController
  def index
    @histories = LentHistory.all
  end
  def new
    biblio = Biblio.where(id: params[:biblio_id]).first
    @history = biblio.lent_histories.build
  end
  def create
    biblio = Biblio.where(id: params[:lent_history][:biblio_id]).first
    render '/public/404.html' and return unless biblio.lendable?
    @history = biblio.lent_histories.build(user_id: current_user.id, state: state_from_commit)
    unless @history.save
      render '/public/404.html' and return
    end
    redirect_to books_index_path
  end

  private

  def state_from_commit
    return LentHistory::OUT if params[:commit] == "貸出"
    LentHistory::LENDABLE
  end

end
