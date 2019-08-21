# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users index API', type: :request do
  it 'returns users data' do
    create(:user,
           username: 'pquest',
           email: 'pquest@gmail.com',
           full_name: 'Philip Lambok',
           bio: 'Backend Engineer')
    create(:user,
           username: 'kokomi',
           email: 'kokomi@gmail.com',
           full_name: 'Kokomi',
           bio: 'Frontend Engineer')
    json_data = {
      users: [
        {
          username: 'pquest',
          email: 'pquest@gmail.com',
          full_name: 'Philip Lambok',
          bio: 'Backend Engineer'
        },
        {
          username: 'kokomi',
          email: 'kokomi@gmail.com',
          full_name: 'Kokomi',
          bio: 'Frontend Engineer'
        }
      ]
    }.to_json
    get '/api/v1/users'
    expect(response.body).to eq json_data
  end
end
