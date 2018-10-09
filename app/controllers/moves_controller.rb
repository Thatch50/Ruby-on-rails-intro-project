class MovesController < ApplicationController
  def show
  end

  def index
    @moves = Move.all
  end
end
