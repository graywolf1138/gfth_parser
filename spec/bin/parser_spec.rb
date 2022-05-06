RSpec.describe 'parser' do
  describe 'script' do
    let(:stdoutput) { Open3.capture3("./bin/parser #{file_path}") }
    let(:file_path) { File.join('spec', 'fixtures', 'sample.txt') }
    let(:result) { stdoutput[0] }
    let(:errors) { stdoutput[1] }
    let(:expected_result) { "\"Nick: 1 fills $0 income\"\n" }

    it { expect(result).to eq expected_result }

    context 'when file path not provided' do
      let(:file_path) { nil }

      it { expect(errors).to eq "./bin/parser: No file provided (FileValidator::FileError)\n" }
    end

    context 'when not existing input file' do
      let(:file_path) { File.join('spec', 'fixtures', 'not_existing.txt') }

      it { expect(errors).to eq "./bin/parser: File does not exist (FileValidator::FileError)\n" }
    end

    context 'when not supported input file' do
      let(:file_path) { File.join('spec', 'fixtures', 'wrong_extension.yml') }

      it { expect(errors).to eq "./bin/parser: File extension not supported (FileValidator::FileExtensionError)\n" }
    end

    context 'when empty input file' do
      let(:file_path) { File.join('spec', 'fixtures', 'empty.txt') }

      it { expect(errors).to eq '' }
    end
  end
end
