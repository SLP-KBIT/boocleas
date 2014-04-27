# == Schema Information
#
# Table name: biblios
#
#  id            :integer          not null, primary key
#  book_id       :integer
#  shelf_id      :integer
#  created_at    :datetime
#  updated_at    :datetime
#  registrant_id :integer
#

class Biblio < ActiveRecord::Base
  belongs_to :book
  belongs_to :shelf
  belongs_to :registrant, class_name: User
  has_many :lent_histories
  has_many :users, through: :lent_histories

  def self.lendable
    self.all.select(&:lendable?)
  end

  def self.out
    LentHistory.out.map(&:biblio)
  end

  def lent_to?(user)
    self.out? && self.lent_histories.order(:id).last.user == user
  end

  def lendable?
    self.lent_histories.empty? || self.lent_histories.order(:id).last.lendable?
  end

  def out?
    self.lent_histories.order(:id).last.out?
  end

  def changeable_to?(next_state)
     self.lent_histories.empty? || self.lent_histories.last.state != next_state
  end
end
