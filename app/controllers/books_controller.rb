class BooksController < ApplicationController
  def index
    if params[:query].present?
      @books = Book.global_search(params[:query])
      # @authors = Author.global_search(params[:query])
      # sql_query = " \
      #   books.title @@ :query \
      #   OR authors.first_name @@ :query \
      #   OR authors.last_name @@ :query \
      # "
      # @books = Book.joins(:author).where(sql_query, query: "%#{params[:query]}%")
    else
      @books = Book.all.order(:id)
    end
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
    # if @author.uniq

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
    # @author = Author.where("first_name LIKE ?", "params[:book][:authors][:first_name]")
    # @author = Author.find(params[:id])
    @author = @book.author
    # @category = @book.category
  end

  def update
    @book = Book.find(params[:id])
    # @author = @book.author.id
    # last_name = @book.author.last_name
    author_first_name = params[:book][:authors][:first_name]
    author_last_name = params[:book][:authors][:last_name]
    @author = Author.new(first_name: author_first_name, last_name: author_last_name)

    @book.author = @author
    @category = Category.find(params[:book][:category_id])
    @book.category = @category
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      # raise
    else
      render "new"
      # raise
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
