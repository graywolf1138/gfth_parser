RSpec.describe Record do
  describe '.initialize' do
    subject { described_class.new(patient_name, drug, event) }

    let(:patient_name) { 'John' }
    let(:drug) { 'Drug A' }
    let(:event) { 'event' }

    it { is_expected.to have_attributes(patient: 'John', prescription: 'Drug A', event: 'event') }
  end
end
