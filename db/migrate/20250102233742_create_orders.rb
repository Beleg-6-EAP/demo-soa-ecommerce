class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :user_id
      t.decimal :amount
      t.string :status

      t.timestamps
    end
  end
end
