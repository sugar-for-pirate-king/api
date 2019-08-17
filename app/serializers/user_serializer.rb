# frozen_string_literal: true

class UserSerializer
  include ActiveModel::Serialization

  attr_reader :username, :email, :full_name, :bio

  def initialize(user)
    @username = user.username
    @email = user.email
    @full_name = user.full_name
    @bio = user.bio
  end

  def attributes
    { 'username': nil, 'email': nil, 'full_name': nil, 'bio': nil }
  end
end
