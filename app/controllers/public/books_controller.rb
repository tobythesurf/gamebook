class Public::BooksController < PublicApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true).page(params[:page])
  end

  # GET /books/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:book_title, :description, :introduction, :user_permission, :user_id, :label_list)
    end
end
