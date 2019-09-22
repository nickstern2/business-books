class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @author = Author.new
  end

  def create
    @book = Book.new(book_params)

    # @category = Category.find[:category_name].where(params[:category_id])

    author_first_name = params[:book][:authors][:first_name]
    author_last_name = params[:book][:authors][:last_name]
    @author = Author.new(first_name: author_first_name, last_name: author_last_name)
    @author.save
    # @book.category_id = @category.id
    @category = Category.find(params[:book][:category_id])
    @book.category = @category

    # Person.where(name: 'Spartacus', rating: 4).ids
#

    @book.author_id = @author.id
    if @book.save
        # raise
      redirect_to books_path
    else
      # raise
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy!
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title)
  end
end
