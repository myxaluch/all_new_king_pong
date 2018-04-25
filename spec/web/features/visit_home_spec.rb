require 'features_helper'

describe 'visit home', type: :feature do
  it 'is successful' do
    visit '/'

    expect(page.body).to include('KingPong')
  end
end
