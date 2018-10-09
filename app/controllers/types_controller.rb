class TypesController < ApplicationController
  def show
  end

  def index
    @types = Type.all
  end
end
