module FeatureOptions
  module Tracking
    module_function

    def required_fields(current_fields)
      current_fields + %i(number issue_date)
    end
  end

  module BasicFourInformation
    module_function

    def required_fields(current_fields)
      current_fields + %i(name gender birth address)
    end
  end

  PassportAddressCheck = Struct.new(:enabled) do
    def required_fields(current_fields)
      if enabled
        current_fields
      else
        current_fields - %i(address)
      end
    end
  end
end
