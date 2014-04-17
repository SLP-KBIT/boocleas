require 'ndl'

class BooksController < ApplicationController
  def index
  end
  def new
    @book = Book.new
  end
  def confirm
    params_from_api = NDL.search_by_isbn(params[:book][:isbn])
    render text: "本が見つかりませんでした。" and return unless params_from_api
    @api = params_from_api
    @book = Book.new(params_from_api)
  end
end
