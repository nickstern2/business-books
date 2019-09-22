class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    @author.create!
    redirect_to authors_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
end
