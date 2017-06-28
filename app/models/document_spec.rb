DocumentSpec = Struct.new(:spec) do
  class_attribute :master

  class << self
    def fetch(type)
      new(master[type.to_sym])
    end
  end

  def pages_for_operation(operation)
    @pages_for_operation ||= spec[:pages][operation.input_option]
  end

  def min_page_for_operation(operation)
    pages_for_operation(operation).first
  end

  def max_page_for_operation(operation)
    pages_for_operation(operation).last
  end
end

DocumentSpec.master = {
  drivers_license: {
    pages: {
      tracking: 2..2,
      personal_information: 2..2
    }
  },
  passport: {
    pages: {
      tracking: 1..1,
      personal_information: 2..2
    }
  }
}
