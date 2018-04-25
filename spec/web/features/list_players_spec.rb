require 'features_helper'

describe 'List players', type: :feature do
  let(:player_repo) { PlayerRepository.new }

  before do
    player_repo.clear

    player_repo.create(name: 'Martin Fowler')
    player_repo.create(name: 'Kent Beck')
  end

  it 'displays each player on the page' do
    visit '/players'

    within '#players' do
      expect(page).to have_css('.player', count: 2), 'Expected to find 2 users'
    end
  end
end
