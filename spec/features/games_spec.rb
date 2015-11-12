require 'rails_helper'

RSpec.feature "Games", type: :feature do
  before(:each) do
    visit root_url
  end

  it 'displays game interface on home page' do
    expect(page).to have_css('#add-one')
    expect(page).to have_css('#add-two')
    expect(page).to have_css('#add-three')
    expect(page).to have_css('#current-amount')
  end

  describe 'the add numbers links' do
    it 'allows users to add one' do
      find('#add-one').click
      within('#current-amount') do
        expect(page).to have_content('1')
      end
    end

    it 'allows users to add two' do
      find('#add-two').click
      within('#current-amount') do
        expect(page).to have_content('2')
      end
    end

    it 'allows users to add three' do
      find('#add-three').click
      within('#current-amount') do
        expect(page).to have_content('3')
      end
    end

    it 'allows users to add multiple numbers' do
      find('#add-three').click
      find('#add-two').click
      within('#current-amount') do
        expect(page).to have_content('5')
      end
    end
  end

  it 'allows users to reset the game' do
    find('#reset-game').click
    within('#current-amount') do
      expect(page).to have_content('0')
    end
  end

  describe 'gameplay' do
    it 'displays a winning message if player won' do
      find('#add-three').click
      find('#add-three').click
      find('#add-three').click
      find('#add-three').click
      find('#add-three').click
      find('#add-three').click
      find('#add-three').click
      expect(page).to have_content('You won!')
    end

    it 'displays a condescending message if player goes over' do
      find('#add-three').click
      find('#add-three').click
      find('#add-three').click
      find('#add-three').click
      find('#add-three').click
      find('#add-three').click
      find('#add-two').click
      find('#add-three').click
      expect(page).to have_content('You should have won, but you went over...')
    end
  end
end
