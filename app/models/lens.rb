class Lens < ApplicationRecord
  validates :name, presence: true

  def title
    "#{name} #{focal_length} (#{generation})"
  end
end
