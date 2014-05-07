class LentHistoryForm
  include ActiveModel::Model

  attr_accessor :title, :date_range

  def initialize(attributes={})
    super
  end

  def search
    histories = LentHistory.all
    histories = histories.select { |hist| hist.biblio.book.title.include? @title } if @title
    histories
  end
end
