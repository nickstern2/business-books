class ReviewsController < ApplicationController
  def index
    @book = Book.find(params[:book_id])
    @reviews = Review.all
  end

  def show
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
  end

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
    # @book.review = @book
  end

  def create
    @review = Review.new(review_params)
    @book = Book.find(params[:book_id])
    @review.book_id = @book.id

    if @review.save
      redirect_to book_path(@book)
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
