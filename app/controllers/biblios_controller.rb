class BibliosController < ApplicationController
  before_action :authenticate_user!
  before_action :get_biblio
  def index
    form_params = params[:biblio_form] || nil
    @biblio_form = BiblioForm.new form_params
    @biblios = @biblio_form.search
  end
  def new
    @biblio = @book.biblios.build
  end
  def show
  end

  private

  def get_biblio
    @biblio = Biblio.where(id: params[:id]).first if params[:id]
  end
end
