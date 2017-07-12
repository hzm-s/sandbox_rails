MatchingPair = Struct.new(:field, :document, :site) do
  def initialize(document, site)
    field = document.field || site.field
    super(
      field.to_s,
      document.value,
      site.value
    )
  end

  def has_document?
    !!document
  end
end
