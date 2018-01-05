class Inquiry < ApplicationRecord
  has_many :vc_addresses, dependent: :destroy

  class << self
    def new_with_default
      new(title: "No title #{Time.current}")
    end
  end
end
