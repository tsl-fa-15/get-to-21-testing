class GameController < ApplicationController
  def home
    @game = Game.new(params[:current], params[:add])
    if params[:add].to_i == 1
      @current_amount = params[:current].to_i + 1
    elsif params[:add].to_i == 2
      @current_amount = params[:current].to_i + 2
    elsif params[:add].to_i == 3
      @current_amount = params[:current].to_i + 3
    else
      @current_amount = 0
    end
  end
end
