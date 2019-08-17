# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true
end
