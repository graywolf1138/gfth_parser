RSpec.describe Parser do
  let(:file_path) { File.join('spec', 'fixtures', 'sample.txt') }

  describe '#perform' do
    subject { described_class.new(file_path).perform }

    it { is_expected.to eq({ 'Nick' => { 1 => 0 } }) }
  end
end
