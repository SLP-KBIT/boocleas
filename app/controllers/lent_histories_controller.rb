class LentHistoriesController < ApplicationController
  def index
    @histories = LentHistory.all
  end
  def new
    biblio = get_biblio
    @history = biblio.lent_histories.build
  end
  def return_new
    biblio = get_biblio
    render '/public/404.html' and return unless biblio.lent_to?(current_user)
    @history = biblio.lent_histories.build
  end
  def create
    biblio = Biblio.where(id: params[:lent_history][:biblio_id]).first
    render '/public/404.html' and return unless biblio.changeable_to?(state_from_commit)
    @history = biblio.lent_histories.build(user_id: current_user.id, state: state_from_commit)
    render '/public/404.html' and return unless @history.save
    redirect_to books_index_path
  end

  private

  def state_from_commit
    return LentHistory::OUT if params[:commit] == "貸出"
    return LentHistory::LENDABLE if params[:commit] == "返却"
  end

  def get_biblio
    Biblio.where(id: params[:biblio_id]).first if params[:biblio_id]
  end
end
