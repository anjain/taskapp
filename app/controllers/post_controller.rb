class PostController < ApplicationController

  def new
    if u_ser_signed_in?
      @post = Post.new
    else
      redirect_to(root_path)
    end
  end

  def create
    if u_ser_signed_in?
      @post = current_u_ser.posts.build(post_params)
    end
    if @post.save
      redirect_to(root_path)
    else
      redirect_to('/newpost')
    end
  end
  private

    def post_params
      params.require(:post).permit(:text)
    end
end
