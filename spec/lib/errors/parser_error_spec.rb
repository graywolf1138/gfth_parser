RSpec.describe ParserError do
  describe '.initialize' do
    subject(:error) { raise(described_class, msg) }

    let(:msg) { 'Sample message' }

    it 'raises error with passed message' do
      expect { error }.to raise_error(described_class, 'Sample message')
    end

    context 'without error message' do
      subject(:error) { raise(described_class) }

      it 'raises error with default message' do
        expect { error }.to raise_error(described_class, 'ParserError occured, exiting application.')
      end
    end
  end
end
