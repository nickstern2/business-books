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
    # @category = Category.new
  end

  def create
    @book = Book.new(book_params)

    author_first_name = params[:book][:authors][:first_name]
    author_last_name = params[:book][:authors][:last_name]
    @author = Author.new(first_name: author_first_name, last_name: author_last_name)
    @author.save

    @category = Category.find(params[:book][:category_id])
    @book.category = @category

    @book.author_id = @author.id
    if @book.save
      redirect_to books_path
    else
      render "new"
    end
  end

  def edit
    @book = Book.find(params[:id])
    @author = @book.author
    # @category = @book.category
  end

  def update
    @book = Book.find(params[:id])

    author_first_name = params[:book][:authors][:first_name]
    author_last_name = params[:book][:authors][:last_name]
    @author = Author.update(first_name: author_first_name, last_name: author_last_name)

    @category = Category.find(params[:book][:category_id])
    @book.category = @category
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render "new"
      raise
    end
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
