class Matching
  include ActiveModel::Model

  attr_accessor :operation_id, :document_data, :site_data

  attr_reader :pairs

  def initialize(params)
    super
    @pairs = document_data.create_pairs(site_data)
  end
end
