module Operations
  Identification = Struct.new(:input_option) do
    delegate :type, to: :input_option, prefix: true

    def initialize(input_option:)
      super(input_option)
    end
  end
end
