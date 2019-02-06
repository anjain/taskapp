class StaticController < ApplicationController
  def home
    if u_ser_signed_in?
      @all = current_u_ser.posts.all.order("created_at DESC")
    end
  end

  def feed
    @temp1 = Accepted.where(sid: current_u_ser.id)
    @temp2 = Accepted.where(rid: current_u_ser.id)

  end
end
