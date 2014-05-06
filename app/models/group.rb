# == Schema Information
#
# Table name: groups
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  max_lent_week :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Group < ActiveRecord::Base
end
