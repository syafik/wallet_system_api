class Deposit < Transaction

  protected

  def wallet_must_exist
    errors.add(:base, "target wallets can't be nil") if target_wallet.nil?
  end

  def balance_should_sufficient; end
end
