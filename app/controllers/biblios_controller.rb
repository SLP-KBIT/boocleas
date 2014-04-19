class BibliosController < ApplicationController
  def index
    @biblios = Biblio.all
  end
  def new
    @book = Book.where(id: params[:book_id]).first
    @biblio = @book.biblios.build
  end
  def create
  end
end
