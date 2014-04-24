class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :get_ldap_gecos

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
