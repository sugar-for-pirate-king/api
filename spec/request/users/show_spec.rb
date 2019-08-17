# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Show', type: :request do
  it 'returns user json data' do
    user = create(:user,
                  username: 'pquest',
                  email: 'pquest@gmail.com',
                  full_name: 'Philip Lambok',
                  bio: 'Software Engineer')
    get "/api/v1/users/#{user.id}"
    json_data = {
      user: {
        username: 'pquest',
        email: 'pquest@gmail.com',
        full_name: 'Philip Lambok',
        bio: 'Software Engineer'
      }
    }.to_json
    expect(response.body).to eq json_data
  end

  it 'returns error message when user not found' do
    get '/api/v1/users/99'
    json_data = {
      error: {
        code: 404,
        message: 'User not found'
      }
    }.to_json
    expect(response.body).to eq json_data
  end
end
