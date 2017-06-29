module Operations
  Identification = Struct.new(:feature_options) do
    def required_fields
      feature_options.reduce([]) { |a,e| e.required_fields(a) }
    end
  end

  module GettingIndividualNumber
    module_function

    def required_fields
      %i(name gender birth address)
    end
  end
end
