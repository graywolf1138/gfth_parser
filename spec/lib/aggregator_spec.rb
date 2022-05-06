RSpec.describe Aggregator do
  describe '#perform' do
    subject { described_class.new(stored_records, counter: counter).call }

    let(:stored_records) do
      { 'Mark' => { 'B' => attributes, 'C' => attributes } }
    end
    let(:attributes) { %w[created filled returned filled filled] }
    let(:counter) { double }

    context 'with valid attributes' do
      before { allow(counter).to receive_message_chain(:new, :call).and_return(3) }

      it { is_expected.to eq('Mark' => { 2 => 6 }) }
    end

    context 'with empty attributes' do
      let(:attributes) { [] }

      before { allow(counter).to receive_message_chain(:new, :call).and_return(0) }

      it { is_expected.to eq('Mark' => { 2 => 0 }) }
    end
  end
end
