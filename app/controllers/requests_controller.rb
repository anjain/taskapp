class RequestsController < ApplicationController

  def index
    @requests = Request.where(uid: current_u_ser.id)
    render 'index'
  end

  def createrequest
    Request.create(cid: current_u_ser.id , uid: USer.find(params[:id]).id)
    redirect_to(root_path)
  end

  def cancelrequest
    @pid = USer.find(params[:id])
    @pid = @pid.id
    Request.where(uid: @pid).delete_all
    redirect_to(root_path)
  end

  def acceptrequest
    @sid = USer.find(params[:id])
    Accepted.create(sid: @sid.id , rid: current_u_ser.id)
    Request.where(cid: @sid.id).delete_all
    Request.where(uid: @sid.id).delete_all
    redirect_to(root_path)
  end

end
