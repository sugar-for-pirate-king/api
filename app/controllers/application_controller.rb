# frozen_string_literal: true

class ApplicationController < ActionController::API
  def json_response(attributes)
    render json: attributes
  end
end
