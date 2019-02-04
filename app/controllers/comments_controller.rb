class CommentsController < ApplicationController

  def new
    if u_ser_signed_in?
      @comment = Comment.new
      @id = Post.find(params[:id])
    else
      redirect_to(root_path)
    end
  end

  def create
    @comment = params.require(:comment).permit(:text)
    @id = params[:id]
    @comment = @comment[:text]

    Comment.create(text: @comment , post_id: @id)
    redirect_to(root_path)
  end
    #
    #@comment = Post.comments.build(params.require(:comment).permit(:text))
    #Comment.create!(text: @comment)
end
