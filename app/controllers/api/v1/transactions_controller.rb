class Api::V1::TransactionsController < ApplicationController
  before_action :authenticate_request
  before_action :find_wallet

  # POST /api/v1/transactions/deposit
  def deposit
    deposit = Deposit.new(target_wallet: @wallet, amount: params[:amount])
    if deposit.save
      render json: { message: 'Deposit success' }, status: :ok
    else
      render json: { errors: deposit.errors }, status: :unprocessable_entity
    end
  end

  # POST /api/v1/transactions/withdraw
  def withdraw
    withdraw = Withdraw.new(source_wallet: @wallet, amount: params[:amount])
    if withdraw.save
      render json: { message: 'Withdraw success' }, status: :ok
    else
      render json: { errors: withdraw.errors }, status: :unprocessable_entity
    end
  end

  # POST /api/v1/transactions/transfer
  def transfer
    target_user = User.find_by(email: params[:to])
    transfer = Transfer.new(source_wallet: @wallet, target_wallet: target_user&.wallet, amount: params[:amount])

    if transfer.save
      render json: { message: 'Transfer success' }, status: :ok
    else
      render json: { errors: transfer.errors }, status: :unprocessable_entity
    end
  end

  private

  def find_wallet
    @wallet = @current_user&.wallet
  end
end
