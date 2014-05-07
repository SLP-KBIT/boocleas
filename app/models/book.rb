# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  isbn         :string(255)
#  author       :text
#  publisher    :string(255)
#  genre        :text
#  keyword      :text
#  created_at   :datetime
#  updated_at   :datetime
#  title        :text
#  published_at :datetime
#

class Book < ActiveRecord::Base
  has_many :biblios
  accepts_nested_attributes_for :biblios
  # before_create :parse_japanese_date_format

  # def parse_japanese_date_format
  #   Date.strptime(self.published_at, "%Y")
  # end
end
