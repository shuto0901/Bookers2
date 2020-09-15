class BooksController < ApplicationController

  def index
    @book_new = Book.new
    @user = User.find(current_user.id)
    @books = Book.all
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    @books = Book.all
    @user = User.find(current_user.id)
    if @book_new.save
    flash[:notice] = "You have creatad book successfully."
    redirect_to book_path(@book_new)
    else
    render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
    @user_book = @user.books
    if @book.update(book_params)
    flash.now[:notice] = 'You have updated book successfully.'
    render 'show'
    else
    render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
