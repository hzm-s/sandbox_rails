class Lens < ApplicationRecord

  def title
    "#{name} #{focal_length} (#{generation})"
  end
end
