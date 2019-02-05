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

  def home
    if (u_ser_signed_in?)
      @post = Post.find_by(id: params[:id])
      @comment = Comment.where(post_id: (params[:id])).order('created_at')
    else
      redirect_to(root_path)
    end
  end
#Comment.create(text: @comment , post_id: @id)
  def update
    @id = Post.find(params[:id]).destroy
    @text = params.require(:post).permit(:text)
    @text = @text[:text]
    Post.create(text: @text , u_ser_id: current_u_ser.id)
    redirect_to(root_path)
  end

  def edit
    @temp = Post.find(params[:id])
    if u_ser_signed_in?
        if current_u_ser.id==@temp.u_ser.id
          render 'edit'
        else
          redirect_to(root_path)
        end
    else
      redirect_to(root_path)
    end
  end

  def index
    if u_ser_signed_in?
      @allposts = current_u_ser.posts.all.order("created_at DESC")
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to(root_path)
  end
  private

    def post_params
      params.require(:post).permit(:text)
    end
end
