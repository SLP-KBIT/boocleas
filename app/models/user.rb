# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  uid                    :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  gecos                  :text
#  is_admin               :boolean
#  is_lendable            :boolean
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :get_ldap_gecos
  validates :is_admin, inclusion: { in: [ true, false ] }
  validates :is_lendable, inclusion: { in: [ true, false ] }

  def get_ldap_gecos
    self.gecos = Devise::LDAP::Adapter.get_ldap_param(self.uid, "gecos").first
  end

  def email
    uid
  end

  def email_changed?
    false
  end
end
