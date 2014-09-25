class Settings < ActiveRecord::Base
  validates :paypal_merchant_email, presence: true
  validates :sandbox_merchant_email, presence: true
end
