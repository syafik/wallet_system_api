class Withdraw < Transaction

  protected

  def wallet_must_exist
    errors.add(:base, "source wallets can't be nil") if source_wallet.nil?
  end
end
