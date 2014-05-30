# == Schema Information
#
# Table name: lent_histories
#
#  id             :integer          not null, primary key
#  biblio_id      :integer
#  user_id        :integer
#  will_return_at :datetime
#  state          :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class LentHistory < ActiveRecord::Base
  belongs_to :biblio
  belongs_to :user
  after_create :set_will_return_at
  LENDABLE = 0
  OUT = 1

  STATE_ACTIONS = {
    LENDABLE => "返却",
    OUT      => "貸出"
  }

  scope :out, -> { group(:biblio_id).having(state: OUT) }

  def self.lent_to(user)
    self.select(:user_id, :biblio_id).uniq.map do |hist|
      history = self.where(user_id: user.id, biblio_id: hist.biblio_id).last
      history if history.try(:out?)
    end.compact.uniq
  end

  def state_to_action
    STATE_ACTIONS[state]
  end

  def lendable?
    self.state == LENDABLE
  end

  def out?
    self.state == OUT
  end

  private

  def set_will_return_at
    if self.out?
      self.will_return_at = self.created_at + self.user.group.max_lent_week.weeks
      self.save
    end
  end
end
