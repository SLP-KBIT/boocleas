class ShelvesController < ApplicationController
  before_action :authenticate_user!
  def index
    @shelves = Shelf.all
  end
end
