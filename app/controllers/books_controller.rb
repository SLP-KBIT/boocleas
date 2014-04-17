class BooksController < ApplicationController
  def index
  end
  def new
    @book = Book.new
  end
  def confirm
    params_from_api = NDL.find_by_isbn(params[:isbn])
    @book = Book.new(params_from_api)
  end
end
