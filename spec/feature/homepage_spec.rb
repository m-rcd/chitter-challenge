feature 'homepage' do
  scenario 'displays title' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
  end
  # 
  # scenario 'user can ' do
  #   visit '/'
  #   fill_in 'peep', with: 'To the well-organized mind, death is but the next great adventure.Albus Dumbledore'
  #   click_button 'Peep'
  #   expect(current_path).to eq '/peeps'
  #   expect(page).to have_content('To the well-organized mind, death is but the next great adventure.Albus Dumbledore')
  # end
end
