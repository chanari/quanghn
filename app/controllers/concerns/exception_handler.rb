module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :handle_record_errors
    rescue_from ExceptionHandler::AuthenticationError, with: :handle_unauthorized
  end

  private

  def handle_record_errors(exception)
    render json: {
      errors: exception.record.errors.full_messages
    }, status: :unprocessable_entity
  end

  def handle_unauthorized
    render json: { message: 'unauthorized' }, status: :unauthorized
  end
end
