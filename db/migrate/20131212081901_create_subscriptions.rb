class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :userid
      t.string :type
      t.string :status
      t.datetime :signup_date
      t.datetime :lastpay_date
      t.datetime :cancel_date
      t.integer :plan
      t.boolean :recurring
      t.boolean :lifetime
      t.datetime :expiration

      t.timestamps
    end
  end
end
