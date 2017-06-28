DocumentSpec = Struct.new(:spec) do
  class_attribute :master

  class << self
    def fetch(type)
      new(master[type.to_sym])
    end
  end

  def min_page_for_operation(operation)
    required_fields = operation.required_fields(spec[:not_exists])
  end

  def max_page_for_operation(operation)
    min_page_for_operation(operation)
  end
end

DocumentSpec.master = {
  drivers_license: {
    not_exists: %i(gender),
    pages: [
      { page: 1, fields: %i(number issue_date name birth address) },
      { page: 2, fields: %i(address) }
    ]
  },
  passport: {
    not_exists: %i(),
    pages: [
      { page: 1, fields: %i(number issue_date name gender birth) },
      { page: 2, fields: %i(address) }
    ]
  }
}
