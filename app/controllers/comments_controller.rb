class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @seller = User.find(@comment.item.seller_id)
    if @comment.save
      redirect_to item_path(@comment.item.id)
    else
      flash[:notice] = 'メッセージの送信に失敗しました'
      redirect_to item_path(@comment.item.id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to item_path(@comment.item.id)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to item_path(@comment.item.id)
    else
      flash[:notice] = 'メッセージの送信に失敗しました'
      redirect_to edit_comment_path(@comment)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment,:item_id).merge(user_id: current_user.id)
    end

end
