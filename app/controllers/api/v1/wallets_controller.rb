class Api::V1::WalletsController < ApplicationController
  before_action :authenticate_request

  # GET api/v1/wallets
  def index
    render json: { wallet: @current_user.wallet.as_json.merge(balance: @current_user.wallet&.balance) }, status: :ok
  end

  # POST api/v1/wallets
  def create
    return render json: { error: 'Wallet already exists' }, status: :unprocessable_entity if @current_user&.wallet.present?

    wallet = Wallet.new(walletable: @current_user, name: params[:name])
    if wallet.save
      render json: { message: 'Wallet successfully created' }, status: :ok
    else
      render json: { errors: wallet.errors }, status: :unprocessable_entity
    end
  end
end
