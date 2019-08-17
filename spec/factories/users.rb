# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    full_name { 'MyString' }
    username { 'MyString' }
    email { 'MyString' }
    bio { 'MyText' }
    password_digest { 'MyString' }
  end
end
