class BooksController < ApplicationController
  def index
  	@createbook = Book.new
  	@books = Book.all

  end

  def top
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end


  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  	flash[:notice] = "successfully"
  	redirect_to book_path(@book.id)
  	else
  		render 'edit'
  	end
  end

  def create
  @createbook = Book.new(book_params)


  	if @createbook.save
  	flash[:notice] = "successfully"
      redirect_to book_path(@createbook)
    else
    	@books=Book.all
      render "index"
    end
  end

  def destroy
  	book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(book.id)
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
