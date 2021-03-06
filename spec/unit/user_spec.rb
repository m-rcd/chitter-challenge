require './app/models/user'

describe User do
  let(:user) do
    User.create(email: 'hermione_granger@hogwarts.co.uk', password: 'wingardiumleviosa',
               password_confirmation: 'wingardiumleviosa')
  end
  let(:mail_gun_client) { double :mail_gun_client }
  let(:sandbox_domain_name) { ENV["sandbox_domain_name"] }

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end
