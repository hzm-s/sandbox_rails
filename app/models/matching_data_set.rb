class MatchingDataSet < SimpleDelegator

  def initialize(fields, data)
    list = fields.map { |f| MatchingData.new(f, data[f]) }
    super(list)
  end

  def create_pairs(other)
    self.zip(other).map { |(a, b)| MatchingPair.new(a, b) }
  end
end
