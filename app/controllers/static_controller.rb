class StaticController < ApplicationController
  def home
    if u_ser_signed_in?
      @all = current_u_ser.posts.all.order("created_at DESC")
    end
  end
end
