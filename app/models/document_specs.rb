module DocumentSpecs
  def self.fetch(type)
    "#{self}::#{type.to_s.classify}".constantize
  end

  module DriversLicense
    module_function

    def min_page_for_operation(operation)
      2
    end

    def max_page_for_operation(operation)
      2
    end
  end

  module Passport
    module_function

    def min_page_for_operation(operation)
      if operation.required_fields.include?(:address)
        2
      else
        1
      end
    end

    def max_page_for_operation(operation)
      min_page_for_operation(operation)
    end
  end
end
