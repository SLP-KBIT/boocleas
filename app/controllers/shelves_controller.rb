class ShelvesController < ApplicationController
  def index
    @shelves = Shelf.all
  end
end
