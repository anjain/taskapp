class LikesController < ApplicationController

  def like
    @pid = Post.find(params[:id])
    Like.create(pid: @pid.id , uid: current_u_ser.id)
    redirect_to(post_path(id: @pid))
  end

  def unlike
    @pid = Post.find(params[:id])
    @pid = @pid.id
    Like.where(pid: @pid , uid: current_u_ser.id).delete_all
    redirect_to(post_path(id: @pid))

  end

end
