class DocumentPayload
  include ActiveModel::Model

  attr_accessor :type, :images
  attr_reader :context

  validates :type, presence: true

  validates :images,
    presence: true,
    document_images_page: { allow_nil: true }

  def validate_for_operation(operation)
    document_spec = DocumentSpec.fetch(type)
    self.context = PayloadValidationContext.new(operation, document_spec)
    valid?
  end

  private

    attr_writer :context
end
