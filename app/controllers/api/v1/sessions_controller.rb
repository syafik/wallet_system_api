class Api::V1::SessionsController < ActionController::API
  # POST /api/v1/sessions
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = TokenEncoderDecoder.encode({ user_id: user.id })
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
