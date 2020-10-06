class UsersController < ApplicationController
 before_action :correct_user, {only: [:edit]}

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @user_book = @user.books
  end

  def edit
   @user = User.find(params[:id])
   if @user.id == current_user.id
    render "edit"
   else
    redirect_to user_path(current_user.id)
   end
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
   flash[:notice] = "You have updated user successfully."
   redirect_to user_path(@user)
   else
   render 'edit'
   end
  end

  def index
    @book_new = Book.new
    @user = User.find(current_user.id)
    @users = User.all
  end

  def show_follow
   @user = User.find(params[:id])
   @users = @user.follow
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
   @user = User.find(params[:id])
   redirect_to user_path(current_user.id) unless @user == current_user
  end

end
