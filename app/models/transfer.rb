class Transfer < Transaction

  protected

  def wallet_must_exist
    errors.add(:base, "source and target wallet can't be nil") if target_wallet.nil? || source_wallet.nil?
  end
end
