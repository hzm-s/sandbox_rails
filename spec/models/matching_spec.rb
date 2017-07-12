require 'rails_helper'

describe Matching do
  it do
    matching_fields = %i(name address option)
    matching =
      described_class.new(
        operation_id: 123,
        document_data: MatchingDataSet.new(
          matching_fields,
          {
            name: 'Name on Doc',
            address: 'Address on Doc',
          }
        ),
        site_data: MatchingDataSet.new(
          matching_fields,
          {
            name: 'Name on Site',
            address: 'Address on Site',
            option: 'Option on Site',
          }
        )
      )

    aggregate_failures do
      pair_name = matching.pairs[0]
      expect(pair_name).to have_document
      expect(pair_name.field).to eq('name')
      expect(pair_name.document).to eq('Name on Doc')
      expect(pair_name.site).to eq('Name on Site')

      pair_address = matching.pairs[1]
      expect(pair_name).to have_document
      expect(pair_address.field).to eq('address')
      expect(pair_address.document).to eq('Address on Doc')
      expect(pair_address.site).to eq('Address on Site')

      pair_option = matching.pairs[2]
      expect(pair_option).to_not have_document
      expect(pair_option.field).to eq('option')
      expect(pair_option.site).to eq('Option on Site')
    end
  end
end
