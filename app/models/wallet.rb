class Wallet < ApplicationRecord
  belongs_to :walletable, polymorphic: true

  has_many :source_transactions, class_name: 'Transaction', foreign_key: 'source_wallet_id'
  has_many :target_transactions, class_name: 'Transaction', foreign_key: 'target_wallet_id'

  def balance
    increase = target_transactions.sum(:amount)
    decrease = source_transactions.sum(:amount)
    increase - decrease
  end

  def process_transaction!(amount, target_wallet = nil)
    Wallet.transaction do
      # Lock the source wallet to prevent race conditions
      lock!

      # Lock the target wallet if it's a transfer
      target_wallet&.lock!

      # Recalculate the balance within the transaction
      current_balance = balance

      raise 'Insufficient balance' if current_balance < amount

      # Create the transaction record
      Transaction.create!(
        source_wallet: self,
        target_wallet: target_wallet,
        amount: amount,
        # Other transaction attributes
      )
    end
  end
end
