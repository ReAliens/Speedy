class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    render json: {
      message: 'You are logged in',
      user: current_user
    }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failed
  end

  def log_out_success
    render json: {
      message: 'logged out up successfully'
    }, status: :ok
  end

  def log_out_failed
    render json: {
      message: 'Something went wrong'
    }, status: :unauthorized
  end
end
