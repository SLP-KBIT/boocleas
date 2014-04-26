class BibliosController < ApplicationController
  def index
    @biblios = Biblio.lendable
  end
  def new
    @book = Book.where(id: params[:book_id]).first
    @biblio = @book.biblios.build
  end
end
