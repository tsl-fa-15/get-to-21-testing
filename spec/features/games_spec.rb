require 'rails_helper'

RSpec.feature "Games", type: :feature do
  it 'displays game interface on home page' do
    visit root_url
    expect(page).to have_css('a#add-one')
    expect(page).to have_css('a#add-two')
    expect(page).to have_css('a#add-three')
    expect(page).to have_css('#current-amount')
  end
end
