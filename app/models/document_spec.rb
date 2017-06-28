DocumentSpec = Struct.new(:spec) do
  SPECS = {
    drivers_license: {
      tracking: {
        min_page: 2, max_page: 2
      },
      personal_information: {
        min_page: 2, max_page: 2
      }
    },
    passport: {
      tracking: {
        min_page: 1, max_page: 1
      },
      personal_information: {
        min_page: 2, max_page: 2
      }
    }
  }.freeze

  class << self
    def fetch(type)
      new(SPECS[type.to_sym])
    end
  end

  def min_page_for_operation(operation)
    spec[operation.input_option_type][:min_page]
  end

  def max_page_for_operation(operation)
    spec[operation.input_option_type][:max_page]
  end
end
