# == Schema Information
#
# Table name: biblios
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  shelf_id   :integer
#  registrant :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Biblio < ActiveRecord::Base
  belongs_to :book
  belongs_to :shelf
  has_many :lent_histories

  scope :lendable, -> { joins(:lent_histories).where('lent_histories.state = ?', LentHistory::LENDABLE) }

  def lendable?
    self.lent_histories.empty? || self.lent_histories.last.lendable?
  end
end
