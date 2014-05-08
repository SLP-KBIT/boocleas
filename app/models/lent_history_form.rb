class LentHistoryForm
  include ActiveModel::Model

  attr_accessor :title, :date_range

  def initialize(attributes={})
    super
  end

  def search
    histories = LentHistory.all
    if @date_range
      date_range = @date_range.split(" to ")
      start  = Time.zone.parse(date_range.first)
      finish  = Time.zone.parse(date_range.last).end_of_day
      histories = histories.where(created_at: start .. finish)
    end
    histories = histories.select { |hist| hist.biblio.book.title.include? @title } if @title
    histories
  end
end
