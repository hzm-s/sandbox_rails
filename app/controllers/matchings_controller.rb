class MatchingsController < ApplicationController

  def new
    @matching =
      Matching.new(
        operation_id: operation_id,
      )
  end
end
