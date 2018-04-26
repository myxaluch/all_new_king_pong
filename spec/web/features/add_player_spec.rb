require 'features_helper'

describe 'Add a player' do
  after do
    PlayerRepository.new.clear
  end

  it 'can create a new player' do
    visit '/players/new'

    within 'form#player-form' do
      fill_in 'Name',  with: 'New player'

      click_button 'Create'
    end

    expect(current_path).to eq('/players')
    expect(page).to have_content('New player')
  end

  it 'displays list of errors when params contains errors' do
    visit '/players/new'

    within 'form#player-form' do
      click_button 'Create'
    end

    expect(current_path).to eq('/players')
    expect(page).to have_content('There was a problem with your submission')
    expect(page).to have_content('Name must be filled')
  end
end
