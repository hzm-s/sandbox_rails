class PayloadValidationContext

  def initialize(operation, document_spec)
    @operation = operation
    @document_spec = document_spec
  end

  def min_page
    @document_spec.min_page_for_operation(@operation)
  end

  def max_page
    @document_spec.max_page_for_operation(@operation)
  end
end
