RSpec.describe Printer do
  describe '#call' do
    subject(:print) { described_class.new(records).call }

    let(:records) do
      { 'Paul' => { 1 => 0 } }
    end
    let(:expected_output) { "\"Paul: 1 fills $0 income\"\n" }

    it 'stdouts expected output' do
      expect { print }.to output(expected_output).to_stdout
    end

    context 'with invalid argument' do
      let(:records) do
        { 'Paul' => 'invalid_value' }
      end

      it 'stdouts expected output' do
        expect { print }.not_to output.to_stdout
      end
    end
  end
end
