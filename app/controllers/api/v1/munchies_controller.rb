class Api::V1::MunchiesController < ApplicationController
  def show
    munchies = MunchiesFacade.get_munchies(params[:location], params[:food])
    render json: MunchiesSerializer.new(munchies)
  end
end