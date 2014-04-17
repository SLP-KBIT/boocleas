# == Schema Information
#
# Table name: books
#
#  id             :integer          not null, primary key
#  isbn           :string(255)
#  author         :text
#  published_year :integer
#  publisheder    :string(255)
#  genre          :text
#  keyword        :text
#  created_at     :datetime
#  updated_at     :datetime
#

class Book < ActiveRecord::Base
end
