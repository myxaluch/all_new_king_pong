RSpec.describe Web::Controllers::Players::Create, type: :action do
  let(:action) { described_class.new }
  let(:repository) { PlayerRepository.new }

  before do
    repository.clear
  end

  subject(:response) { action.call(params) }

  context 'whhen provide valid params' do
    let(:params) { Hash[player: { name: 'New player' }] }

    it 'creates a new player' do
      subject
      player = repository.last

      expect(player.id).not_to be_nil
      expect(player.name).to eq(params.dig(:player, :name))
    end

    it 'is successful redirect user to players list' do
      response = action.call(params)
      expect(response[0]).to eq 302
      expect(response[1]['Location']).to eq '/players'
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[player: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      expect(response[0]).to eq 422
    end

    it 'dumps errors in params' do
      subject
      errors = action.params.errors

      expect(errors.dig(:player, :name)).to contain_exactly('is missing')
    end
  end
end
