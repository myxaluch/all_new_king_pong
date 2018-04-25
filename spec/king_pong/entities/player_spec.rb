RSpec.describe Player, type: :entity do
  let(:name) { 'Sasha kotov' }
  let(:player) { Player.new(name: name) }

  it 'can be initialized with attributes' do
    expect(player.name).to eq(name)
  end
end
