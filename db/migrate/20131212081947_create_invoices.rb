class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :userid
      t.integer :subscr_id
      t.boolean :active
      t.string :invoice_number
      t.datetime :created_date
      t.datetime :transaction_date
      t.integer :used_plan
      t.string :method
      t.decimal :amount
      t.string :currency

      t.timestamps
    end
  end
end
