# class User < ApplicationRecord
# end

class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, uniqueness: { case_sensitive: false }
  validates :password_confirmation, presence: true


end