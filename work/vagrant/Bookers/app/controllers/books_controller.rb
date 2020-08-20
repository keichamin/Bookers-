class BooksController < ApplicationController
	def top
	end

	def new
  	  @book = Book.new
    end

    def create
      @book = Book.new(book_params)

    if @book.save
       flash[:notice] = 'successfully'
       redirect_to book_path(@book)
    else
   	   flash[:notice] = "can't be blank error"
   	   @books=Book.all
   	   @book =Book.new
   	   render  :index
   	end
   end

  def index
  	@books =Book.all
  	@book =Book.new
  end

  def show
     @book = Book.find(params[:id])
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
       redirect_to book_path(book.id)
       flash[:notice] = 'successfully'
   else  flash[:notice] = 'error'
   	     @books =Book.all
  	     @book =Book.new
   	     render :index
   end
  end

  def destroy
       book = Book.find(params[:id])
    if book.destroy
       redirect_to books_path
       flash[:notice] = 'successfully'
   else
   	   flash.now[:alert] = 'error'
   	   render :index
   end
end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end


