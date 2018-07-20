module AuthenticationMethods
  def current_user
    return @current_user if defined?(@current_user)

    @current_user = find_current_user_from_request_header
  end

  def require_user!
    unless current_user
      render json: { errors: ['Invalid user token'] },
        status: :unauthorized

      return false
    end
  end

  private

  def find_current_user_from_request_header
    User.find_by(api_token: api_token)
  end

  def api_token
    request.headers['X-Api-Token']
  end
end
