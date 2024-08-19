class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :source_wallet, foreign_key: { to_table: 'wallets' }
      t.references :target_wallet, foreign_key: { to_table: 'wallets' }
      t.decimal :amount
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
