require_relative '../../lib/parser/errors/parser_error'

RSpec.describe FileValidator do
  describe '.valid?' do
    subject(:validate) { described_class.valid?(file_path) }

    let(:file_path) { File.join('spec', 'fixtures', 'sample.txt') }

    it { is_expected.to be(true) }

    context 'when not provided' do
      let(:file_path) { nil }

      it 'raises error' do
        expect { validate }.to raise_error(described_class::FileError, 'No file provided')
      end
    end

    context 'when file extenstion not supported' do
      let(:file_path) { File.join('spec', 'fixtures', 'not_supported.log') }

      it 'raises error' do
        expect { validate }.to raise_error(described_class::FileExtensionError, 'File extension not supported')
      end
    end

    context 'when file not exist' do
      let(:file_path) { File.join('spec', 'fixtures', 'not_existing.txt') }

      it 'raises error' do
        expect { validate }.to raise_error(described_class::FileError, 'File does not exist')
      end
    end
  end
end
