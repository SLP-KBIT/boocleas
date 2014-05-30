require 'ndl'

class BooksController < ApplicationController
  before_action :admin_only!, except: :show
  def index
    @books = Book.all
  end
  def new
    @book = Book.new
  end
  def confirm
    params_from_api = NDL.search_by_isbn(params[:book][:isbn])
    render text: "本が見つかりませんでした。" and return unless params_from_api
    @api = params_from_api
    @book = Book.new(params_from_api)
    @book.biblios.build
    @shelves = Shelf.all
  end
  def create
    @book = Book.new(book_params)
    @book.biblios.last.registrant_id = current_user.id
    @book = nil unless @book.save
    unless @book
      flash.now[:error] = "書籍の追加に失敗しました。"
      render :new and return
    end
    flash[:success] = "書籍を登録しました。"
    redirect_to new_book_path
  end
  def show
    @book = Book.where(id: params[:id]).first if params[:id]
  end
  def destroy
    @book = Book.where(id: params[:id]).first if params[:id]
    @book.biblios.destroy_all
    @book.destroy
    redirect_to books_index_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :publisher, :published_at, :keyword,
      biblios_attributes: [:shelf_id]
    )
  end
end
