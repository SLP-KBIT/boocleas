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

  LENDABLE = 0
  OUT = 1

  STATE_ACTIONS = {
    LENDABLE => "返却",
    OUT      => "貸出"
  }

  scope :lent_to, -> (user) { where(user_id: user.id).group(:biblio_id).having(state: OUT) }

  def state_to_action
    STATE_ACTIONS[state]
  end

  def lendable?
    self.state == LENDABLE
  end

  def out?
    self.state == OUT
  end
end
