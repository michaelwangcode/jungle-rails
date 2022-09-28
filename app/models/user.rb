class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }, :if => :password_digest_changed? 
  validates :password_confirmation, presence: true

  before_save { email.downcase! }

  def self.authenticate_with_credentials(email, password)
    email.downcase!
    email.strip!
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end
end