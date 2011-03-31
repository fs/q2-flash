class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :check_domain_name
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def role?(role)
    self.role == role
  end

  private

  def check_domain_name
    domain_names = BlackDomain.all.map(&:domain_name)
    email_domain = email.split('@').last

    result = domain_names.detect do |domain_name|
      email_domain =~ Regexp.new("^#{domain_name}$")
    end
    self.errors.add(:email, "not allowed domain name") if result
  end
end
