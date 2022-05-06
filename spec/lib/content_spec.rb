RSpec.describe Content do
  describe '#parse' do
    subject(:parse_content) { described_class.new(file_path, storage: storage, record: record).parse }

    let(:file_path) { File.join('spec', 'fixtures', 'sample.txt') }
    let(:storage) { double }
    let(:record) { double }

    before do
      allow(record).to receive(:new).with('Nick', 'A', 'created')
      allow(storage).to receive(:store)

      parse_content
    end

    it { is_expected.to eq(storage) }

    it 'creates new Record' do
      expect(record).to have_received(:new)
    end

    it 'stores record in Storage' do
      expect(storage).to have_received(:store)
    end
  end
end
