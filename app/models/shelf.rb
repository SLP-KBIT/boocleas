# == Schema Information
#
# Table name: shelves
#
#  id         :integer          not null, primary key
#  genre      :text
#  room       :string(255)
#  position   :text
#  created_at :datetime
#  updated_at :datetime
#

class Shelf < ActiveRecord::Base
  has_many :biblios
  def position_and_genre
    position + " : " + genre
  end
end
