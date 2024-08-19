class ApplicationController < ActionController::API
  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    @decoded_token = TokenEncoderDecoder.decode(token) if token
    @current_user = User.find_by(id: @decoded_token) if @decoded_token
    render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
  end
end
