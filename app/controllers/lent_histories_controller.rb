class LentHistoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    form_params = params[:lent_history_form] || nil
    @form = LentHistoryForm.new form_params
    @histories = @form.search
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
    if !current_user.is_lendable && params[:commit] == "貸出"
      flash[:error] = "あなたは貸出禁止ユーザのため、貸し出しできません。"
      redirect_to my_path and return
    end
    biblio = Biblio.where(id: params[:lent_history][:biblio_id]).first
    render '/public/404.html' and return unless biblio.changeable_to?(state_from_commit)
    @history = biblio.lent_histories.build(user_id: current_user.id, state: state_from_commit)
    render '/public/404.html' and return unless @history.save
    flash[:success] = "#{@history.biblio.book.title} を貸し出しました。" if params[:commit] == "貸出"
    flash[:success] = "#{@history.biblio.book.title} を返却しました。" if params[:commit] == "返却"
    redirect_to my_path and return
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
