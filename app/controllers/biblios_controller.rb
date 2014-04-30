class BibliosController < ApplicationController
  before_action :authenticate_user!
  def index
    form_params = params[:biblio_form] || nil
    @biblio_form = BiblioForm.new form_params
    @biblios = @biblio_form.search
  end
  def new
    @book = Book.where(id: params[:book_id]).first
    @biblio = @book.biblios.build
  end
end
