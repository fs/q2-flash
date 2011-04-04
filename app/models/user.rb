class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :check_domain_name
  before_validation :generate_password!
  after_create :send_confirmation
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
    :first_name, :last_name, :title, :financial_institution, :phone, :role

  def role?(role)
    self.role == role
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def generate_password!
    user_password = SexyTempPassword.generate
    self.password = user_password
    self.password_confirmation = user_password
  end

  def send_confirmation
    UserMailer.registration_confirmation(self, self.password).deliver
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
