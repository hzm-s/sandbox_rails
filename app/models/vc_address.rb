class VcAddress < ApplicationRecord
  validates :currency, presence: true
  validates :address, presence: true

  def filled?
    currency.present? || address.present?
  end
end
