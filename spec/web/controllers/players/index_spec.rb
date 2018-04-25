RSpec.describe Web::Controllers::Players::Index, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:player_repo) { PlayerRepository.new }

  before do
    player_repo.clear

    @book = player_repo.create(name: 'Test1')
  end

  subject(:response) { action.call(params) }

  it 'is successful' do
    expect(response[0]).to eq 200
  end

  it 'exposes all books' do
    response
    expect(action.exposures[:players]).to contain_exactly(@book)
  end
end
