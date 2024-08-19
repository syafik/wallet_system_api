class Transaction < ApplicationRecord
  # source wallet required when withdraw and transfer
  # target wallet required when deposit and transfer
  belongs_to :source_wallet, class_name: 'Wallet', optional: true
  belongs_to :target_wallet, class_name: 'Wallet', optional: true

  validates :amount, numericality: { greater_than: 0 }
  validate :wallet_must_exist
  validate :balance_should_sufficient

  protected

  def wallet_must_exist; end

  def balance_should_sufficient
    Wallet.transaction do
      source_wallet.with_lock do
        # Recalculate the balance within the lock to ensure it's accurate
        errors.add(:base, 'Insufficient balance') if source_wallet.balance < amount
      end
    end
  end
end
