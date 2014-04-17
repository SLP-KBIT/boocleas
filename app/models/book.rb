# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  isbn         :string(255)
#  author       :text
#  published_at :integer
#  publisher    :string(255)
#  genre        :text
#  keyword      :text
#  created_at   :datetime
#  updated_at   :datetime
#  title        :text
#

class Book < ActiveRecord::Base
end
