RSpec.describe IncomeCounter do
  describe '#call' do
    subject { described_class.new(events).call }

    let(:events) { %w[created filled returned] }

    it { is_expected.to eq(-1) }

    context 'when events are invalid (no create event)' do
      let(:events) { %w[returned filled returned] }

      it { is_expected.to eq(0) }
    end
  end
end
