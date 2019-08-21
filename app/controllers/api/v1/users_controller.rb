# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all
        users_json = []
        users.find_each do |user|
          serializer = UserSerializer.new(user)
          users_json.push(serializer)
        end
        json_response(users: users_json)
      end

      def show
        user = User.find_by(id: params[:id])
        if user.blank?
          json_response(error: { code: 404, message: 'User not found' })
          return false
        end

        serializer = UserSerializer.new(user)
        json = serializer.serializable_hash
        json_response(user: json)
      end
    end
  end
end
