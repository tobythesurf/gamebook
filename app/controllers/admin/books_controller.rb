class Admin::BooksController < ApplicationController
  layout "admin"
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /books
  def index
    @books = current_user.books.page(params[:page]).per(2)
  end

  # GET /books/1
  def show
    current_user.books.find(params[:id])
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    current_user.books.find(params[:id])
  end

  # POST /books
  def create
    @book = Book.new(book_params.merge(user_id: current_user.id))

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params.merge(user_id: current_user.id))
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = current_user.books.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:book_title, :description, :introduction, :user_permission, :user_id, :label_list)
    end
end
