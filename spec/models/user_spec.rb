# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'valid with full_name, username, email, bio, password and password_confirmation' do
    user = build(:user,
                 full_name: 'Kokomi Manako',
                 username: 'kokomi',
                 email: 'kokomi@gmail.com',
                 bio: 'Chess Player',
                 password: 'secret123',
                 password_confirmation: 'secret123')
    user.valid?
    expect(user.errors).to be_blank
  end

  it 'invalid without username' do
    user = build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include "can't be blank"
  end

  it 'invalid without email' do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include "can't be blank"
  end

  it 'invalid with duplicate username' do
    create(:user, username: 'pquest')
    user = build(:user, username: 'Pquest')
    user.valid?
    expect(user.errors[:username]).to include 'has already been taken'
  end

  it 'invalid with password and password_confirmation doesnt match' do
    user = build(:user, password: 'secret123', password_confirmation: 'secret1234')
    user.valid?
    expect(user.errors[:password_confirmation]).to include "doesn't match Password"
  end
end
