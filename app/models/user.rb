class User < ApplicationRecord
  has_one :note, dependent: :destroy
end
