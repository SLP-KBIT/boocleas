# == Schema Information
#
# Table name: lent_histories
#
#  id            :integer          not null, primary key
#  biblio_id     :integer
#  user_id       :integer
#  wil_return_at :datetime
#  state         :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class LentHistory < ActiveRecord::Base
  belongs_to :biblio
  belongs_to :user
end
