feature 'sign up' do
  scenario 'user can sign up' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome AlbusD!')
    expect(User.first.email).to eq('albus_dumbledore@hogwarts.co.uk')
  end

  scenario 'require matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'with a password that does not match the confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/signup')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "user can't sign up if username is already in use" do
    sign_up(username: 'AlbusD')
    click_button 'Log out'
    expect { sign_up(username: 'AlbusD') }.not_to change(User, :count)
    expect(page).to have_content "Username is already taken"
  end

  scenario "user can't sign up if email is already in use" do
    sign_up(email: 'albus_dumbledore@hogwarts.co.uk')
    click_button 'Log out'
    expect { sign_up(email: 'albus_dumbledore@hogwarts.co.uk') }.not_to change(User, :count)
    expect(page).to have_content "Email is already taken"
  end

  scenario "user can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/signup')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "user can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/signup')
    expect(page).to have_content('Email has an invalid format')
  end
end
