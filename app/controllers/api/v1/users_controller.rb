# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def show
        user = User.find_by(id: params[:id])
        if user.blank?
          json_response(error: { code: 404, message: 'User not found' })
          return false
        end

        serializer = UserSerializer.new(user)
        attributes = serializer.serializable_hash
        json_response(user: attributes)
      end
    end
  end
end
