class BooksController < ApplicationController
  def index
    @books = Book.paginate(:page => params[:page]||1)
  end 

  def show
    @book = Book.find(params[:id])
  end 

  def new 
    @book = Book.new
  end 

  def edit
    @book = Book.find(params[:id])
  end 

  def create
    @book = Book.new(params[:book])
    @book.user = current_user
    if @book.save
      redirect_to books_path(@book), :notice => 'Book was successfully created.'
    else
      render :action => "new"
    end 
  end 

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(params[:book])
      redirect_to books_path(@book), :notice => 'Book was successfully updated.'
    else
      render :action => "edit"
    end 
  end 

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end 
end
