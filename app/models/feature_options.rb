module FeatureOptions
  module Tracking
    module_function

    def required_fields
      %i(number issue_date)
    end
  end

  module BasicFourInformation
    module_function

    def required_fields
      []
    end
  end

  module PassportAddressCheck
    module_function

    def required_fields
      %i(address)
    end
  end
end
