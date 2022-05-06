RSpec.describe Storage do
  describe '#store' do
    subject { described_class.new.store(record) }

    # rubocop:disable RSpec/VerifiedDoubles
    let(:record) { double('sample_record', patient: 'John', prescription: 'A', event: 'created') }
    # rubocop:enable all

    it { is_expected.to eql({ 'John' => { 'A' => ['created'] } }) }
  end
end
