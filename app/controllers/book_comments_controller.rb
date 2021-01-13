class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
    @user = @book.user
    @book_comment = BookComment.new
  end
  

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    @book = Book.find(params[:book_id])
    @user = @book.user
    @book_comment = BookComment.new
  end


  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
