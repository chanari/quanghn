module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end

  included do
    rescue_from ExceptionHandler::AuthenticationError, with: :handle_unauthorized
    rescue_from ActiveRecord::RecordInvalid, with: :handle_record_errors
    rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  end

  private

  def handle_unauthorized
    render json: { message: 'unauthorized' }, status: :unauthorized
  end

  def handle_record_errors(exception)
    render json: {
      errors: exception.record.errors.full_messages
    }, status: :unprocessable_entity
  end

  def handle_not_found(exception)
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found }
      format.json {
        render json: {
          message: 'not_found'
        }, status: :not_found
      }
    end
  end
end
