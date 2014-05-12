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

  before_save :default_shelf

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

  def is_contain?(keyword)
    keyword.downcase
    [self.book.title, self.book.author, self.book.publisher, self.shelf.position_and_genre].select{ |e| e.downcase.include? keyword }.present?
  end

  private

  def default_shelf
    self.shelf_id = Shelf.where(position: "未登録").first.id if self.shelf_id.nil?
  end
end
