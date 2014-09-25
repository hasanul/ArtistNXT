class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :paypal_merchant_email
      t.string :sandbox_merchant_email
      t.boolean :sandbox
      t.string :currency

      t.timestamps
    end
  end
end
