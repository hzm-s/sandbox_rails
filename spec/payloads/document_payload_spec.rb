require 'rails_helper'

describe DocumentPayload, '#validate_for_operation' do
  subject do
    described_class.new(params).tap do |dp|
      dp.validate_for_operation(operation)
    end
  end

  context 'Operation: Identification' do
    context 'InputOption: Tracking' do
      let(:operation) do
        Operations::Identification.new([FeatureOptions::Tracking])
      end

      context 'Drivers license' do
        let(:valid_params) do
          {
            type: 'drivers_license',
            images: %w(page1 page2)
          }
        end

        context 'when valid' do
          let(:params) { valid_params }
          it { is_expected.to be_valid }
        end

        context 'when missing page' do
          let(:params) { valid_params.merge(images: %w(page1)) }
          it { is_expected.to_not be_valid }
          it { expect(subject.errors[:images]).to eq(['missing_page']) }
        end

        context 'when too many pages' do
          let(:params) { valid_params.merge(images: %w(page1 page2 page3)) }
          it { is_expected.to_not be_valid }
          it { expect(subject.errors[:images]).to eq(['too_many_pages']) }
        end
      end

      context 'Passport' do
        let(:valid_params) do
          {
            type: 'passport',
            images: %w(page1)
          }
        end

        context 'when valid' do
          let(:params) { valid_params }
          it { is_expected.to be_valid }
        end

        context 'when missing page' do
          let(:params) { valid_params.merge(images: %w()) }
          it { is_expected.to_not be_valid }
          it { expect(subject.errors[:images]).to eq([%Q(can't be blank)]) }
        end

        context 'when too many pages' do
          let(:params) { valid_params.merge(images: %w(page1 page2)) }
          it { is_expected.to_not be_valid }
          it { expect(subject.errors[:images]).to eq(['too_many_pages']) }
        end
      end
    end

    context 'InputOption: BasicFourInformation' do
      let(:operation) do
        Operations::Identification.new([FeatureOptions::BasicFourInformation])
      end

      context 'Drivers license' do
        let(:valid_params) do
          {
            type: 'drivers_license',
            images: %w(page1 page2)
          }
        end

        context 'when valid' do
          let(:params) { valid_params }
          it { is_expected.to be_valid }
        end

        context 'when missing page' do
          let(:params) { valid_params.merge(images: %w(page1)) }
          it { is_expected.to_not be_valid }
          it { expect(subject.errors[:images]).to eq(['missing_page']) }
        end

        context 'when too many pages' do
          let(:params) { valid_params.merge(images: %w(page1 page2 page3)) }
          it { is_expected.to_not be_valid }
          it { expect(subject.errors[:images]).to eq(['too_many_pages']) }
        end
      end

      context 'Passport Address:OFF' do
        let(:operation) do
          Operations::Identification.new(
            [
              FeatureOptions::BasicFourInformation,
              FeatureOptions::PassportAddressCheck.new(false)
            ]
          )
        end

        let(:valid_params) do
          {
            type: 'passport',
            images: %w(page1)
          }
        end

        context 'when valid' do
          let(:params) { valid_params }
          it { is_expected.to be_valid }
        end

        context 'when missing page' do
          let(:params) { valid_params.merge(images: %w()) }
          it { is_expected.to_not be_valid }
          it { expect(subject.errors[:images]).to eq([%Q(can't be blank)]) }
        end

        context 'when too many pages' do
          let(:params) { valid_params.merge(images: %w(page1 page2)) }
          it { is_expected.to_not be_valid }
          it { expect(subject.errors[:images]).to eq(['too_many_pages']) }
        end
      end

      context 'Passport Address:ON' do
        let(:operation) do
          Operations::Identification.new(
            [
              FeatureOptions::BasicFourInformation,
              FeatureOptions::PassportAddressCheck.new(true)
            ]
          )
        end

        let(:valid_params) do
          {
            type: 'passport',
            images: %w(page1 page2)
          }
        end

        context 'when valid' do
          let(:params) { valid_params }
          it { is_expected.to be_valid }
        end

        context 'when missing page' do
          let(:params) { valid_params.merge(images: %w(page1)) }
          it { is_expected.to_not be_valid }
          it { expect(subject.errors[:images]).to eq(['missing_page']) }
        end

        context 'when too many pages' do
          let(:params) { valid_params.merge(images: %w(page1 page2 page3)) }
          it { is_expected.to_not be_valid }
          it { expect(subject.errors[:images]).to eq(['too_many_pages']) }
        end
      end
    end
  end

  context 'Operation: GettingIndividualNumber' do
    let(:operation) do
      Operations::GettingIndividualNumber
    end

    context 'Drivers license' do
      let(:valid_params) do
        {
          type: 'drivers_license',
          images: %w(page1 page2)
        }
      end

      context 'when valid' do
        let(:params) { valid_params }
        it { is_expected.to be_valid }
      end

      context 'when missing page' do
        let(:params) { valid_params.merge(images: %w(page1)) }
        it { is_expected.to_not be_valid }
        it { expect(subject.errors[:images]).to eq(['missing_page']) }
      end

      context 'when too many pages' do
        let(:params) { valid_params.merge(images: %w(page1 page2 page3)) }
        it { is_expected.to_not be_valid }
        it { expect(subject.errors[:images]).to eq(['too_many_pages']) }
      end
    end

    context 'Passport' do
      let(:valid_params) do
        {
          type: 'passport',
          images: %w(page1 page2)
        }
      end

      context 'when valid' do
        let(:params) { valid_params }
        it { is_expected.to be_valid }
      end

      context 'when missing page' do
        let(:params) { valid_params.merge(images: %w(page1)) }
        it { is_expected.to_not be_valid }
        it { expect(subject.errors[:images]).to eq(['missing_page']) }
      end

      context 'when too many pages' do
        let(:params) { valid_params.merge(images: %w(page1 page2 page3)) }
        it { is_expected.to_not be_valid }
        it { expect(subject.errors[:images]).to eq(['too_many_pages']) }
      end
    end
  end
end
