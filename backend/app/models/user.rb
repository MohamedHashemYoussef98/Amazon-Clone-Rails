class User < ApplicationRecord
  require "bcrypt"

  validates :email, presence: true, length: { minimum: 3, maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 8, maximum: 100 }

  before_save :encrypt_password

  private

  def encrypt_password
    if password.present?
      self.password = BCrypt::Password.create(password)
    end
  end

  public

  def valid_password?(password)
    BCrypt::Password.new(self.password) == password
  end
end
