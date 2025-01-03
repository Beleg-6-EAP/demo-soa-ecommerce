class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :order_id
      t.boolean :success

      t.timestamps
    end
  end
end
