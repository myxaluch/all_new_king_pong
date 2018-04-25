RSpec.describe Web::Views::Players::Index, type: :view do
  let(:exposures) { Hash[players: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/players/index.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #players' do
    expect(view.players).to eq exposures.fetch(:players)
  end

  context 'when there are no players' do
    it 'shows a placeholder message' do
      expect(rendered).to include('<p class="placeholder">There are no players yet.</p>')
    end
  end

  context 'when there are players' do
    let(:player_1) { Player.new(name: 'Test1') }
    let(:player_2) { Player.new(name: 'Test2') }

    let(:exposures) { Hash[players: [player_1, player_2]] }

    it 'lists them all' do
      expect(rendered.scan(/class="player"/).count).to eq(2)
      expect(rendered).to include("#{player_1.name}")
      expect(rendered).to include("#{player_2.name}")
    end

    it 'hides placeholder message' do
      expect(rendered).to_not include('<p class="placeholder">There are no players yet.</p>')
    end
  end
end
