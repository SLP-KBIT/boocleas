class LentHistoriesController < ApplicationController
  def index
    @histories = LentHistory.all
  end
  def new
  end
end
