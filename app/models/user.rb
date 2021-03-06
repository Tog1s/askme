require 'openssl'

class User < ApplicationRecord
  # Шифрование паролей
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :questions
  has_many :authorized_questions, class_name: 'Question', foreign_key: :author_id, dependent: :nullify

  validates :email, presence: true, uniqueness: true, format: {with: /\A.+@.+\..+\z/}
  validates :username, presence: true,  length: {maximum: 40}, format: {with: /\A[a-zA-Z0-9_]+\z/}
  validates :profile_color, length: {maximum: 6}, format: {with: /\A[a-fA-F0-9]+\z/}, on: :update, allow_blank: true
  validates_uniqueness_of :username, :case_sensitive => false
  
  before_validation :downcase_username
  
  attr_accessor :password
  validates_presence_of :password, on: :create
  validates_confirmation_of :password
  before_save :encrypt_password
  before_save :set_profile_color

  def downcase_username
    if username.present?
      self.username = username.downcase
    end
  end
  
  def encrypt_password
    if self.password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST)
      )
    end
  end
  
  def set_profile_color
    self.profile_color ||= '#005a55'
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end
end
