class ApplicationController < ActionController::Base
  # rescue_from User::NotAuthorized, with: :deny_access # self defined exception
  rescue_from ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound, with: :render_error

  def render_error(err)
    render json: { message: err.message, status: :bad_request }
  end
end
