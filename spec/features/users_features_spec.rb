require_relative "../rails_helper.rb"
describe 'Feature Test: User Signup', :type => :feature do

  it 'successfully signs up as non-admin' do
    visit '/users/new'
    expect(current_path).to eq('/users/new')
    # user_signup method is defined in login_helper.rb
    user_signup
    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Amy Poehler")
    expect(page).to have_content("Mood")
    expect(page).to have_content("happy")
    expect(page).to have_content("15")
    expect(page).to have_content("58")
  end

  it "on sign up, successfully adds a session hash" do
    visit '/users/new'
    # user_signup method is defined in login_helper.rb
    user_signup
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

  it 'successfully logs in as non-admin' do
    
    # user_login method is defined in login_helper.rb
    create_standard_user
    visit '/signin'
    expect(current_path).to eq('/signin')
    user_login
    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Mindy")
    expect(page).to have_content("Mood")
    expect(page).to have_content("happy")
    expect(page).to have_content("10")
    expect(page).to have_content("50")
  end

  it "on log in, successfully adds a session hash" do
    create_standard_user
    visit '/signin'
    # user_login method is defined in login_helper.rb
    user_login
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

  it 'prevents user from viewing user show page and redirects to home page if not logged in' do
    create_standard_user
    visit '/users/1'
    expect(current_path).to eq('/')
    expect(page).to have_content("Sign Up")
  end

  it 'successfully signs up as admin' do
    visit '/users/new'
    expect(current_path).to eq('/users/new')
    # admin_signup method is defined in login_helper.rb
    admin_signup
    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Walt Disney")
    expect(page).to have_content("ADMIN")
  end

  it "on sign up for admin, successfully adds a session hash" do
    visit '/users/new'
    # admin_signup method is defined in login_helper.rb
    admin_signup
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

  it 'successfully logs in as admin' do
    create_standard_and_admin_user
    visit '/signin'
    expect(current_path).to eq('/signin')
    # admin_login method is defined in login_helper.rb
    admin_login
    expect(current_path).to eq('/users/2')
    expect(page).to have_content("Walt Disney")
    expect(page).to have_content("ADMIN")
  end

  it "on log in, successfully adds a session hash to admins" do
    create_standard_and_admin_user
    visit '/signin'
    # admin_login method is defined in login_helper.rb
    admin_login
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

end

describe 'Feature Test: User Signout', :type => :feature do

  it 'has a link to log out from the users/show page' do
    visit '/users/new'
    # user_signup method is defined in login_helper.rb
    user_signup
    expect(page).to have_content("Log Out")
  end

  it 'redirects to home page after logging out' do
    visit '/users/new'
    # user_signup method is defined in login_helper.rb
    user_signup
    click_link("Log Out")
    expect(current_path).to eq('/')
  end

  it "successfully destroys session hash when 'Log Out' is clicked" do
    visit '/users/new'
    # user_signup method is defined in login_helper.rb
    user_signup
    click_link("Log Out")
    expect(page.get_rack_session).to_not include("user_id")
  end

  it 'has a link to log out from the users/show page when user is an admin' do
    visit '/users/new'
    # admin_signup method is defined in login_helper.rb
    admin_signup
    expect(page).to have_content("Log Out")
  end

  it 'redirects to home page after admin logs out when user is an admin' do
    visit '/users/new'
    # admin_signup method is defined in login_helper.rb
    admin_signup
    click_link("Log Out")
    expect(current_path).to eq('/')
  end

  it "successfully destroys session hash when 'Log Out' is clicked as admin" do
    visit '/users/new'
    # admin_signup method is defined in login_helper.rb
    admin_signup
    click_link("Log Out")
    expect(page.get_rack_session).to_not include("user_id")
  end
end

describe 'Feature Test: Go on a Ride', :type => :feature do

  before :each do
    @rollercoaster = Attraction.create(
      :name => "Roller Coaster",
      :tickets => 5,
      :nausea_rating => 2,
      :happiness_rating => 4,
      :min_height => 32
    )
    @ferriswheel = Attraction.create(
      :name => "Ferris Wheel",
      :tickets => 2,
      :nausea_rating => 2,
      :happiness_rating => 1,
      :min_height => 28
    )
    @teacups = Attraction.create(
      :name => "Teacups",
      :tickets => 1,
      :nausea_rating => 5,
      :happiness_rating => 1,
      :min_height => 28
    )
    visit '/users/new'
    user_signup
  end

  it 'has a link from the user show page to the attractions index page' do
    expect(page).to have_content("See attractions")
    click_link('See attractions')
  end

  it 'links from the user show page to the attractions index page' do
    click_link('See attractions')
    expect(current_path).to eq('/attractions')
  end

  it 'prevents users from editing/deleting/adding rides on the index page' do
    click_link('See attractions')
    expect(current_path).to eq('/attractions')
    expect(page).to_not have_content("edit")
    expect(page).to_not have_content("delete")
    expect(page).to_not have_content("new attraction")
  end

  it 'has titles of the rides on the attractions index page' do
    click_link('See attractions')
    expect(page).to have_content("#{@ferriswheel.name}")
    expect(page).to have_content("#{@rollercoaster.name}")
  end

  it "has links on the attractions index page to the attractions' show pages" do
    click_link('See attractions')
    expect(page).to have_content("Go on #{@ferriswheel.name}")
    expect(page).to have_content("Go on #{@rollercoaster.name}")
  end

  it "links from the attractions index page to the attractions' show pages" do
    click_link('See attractions')
    click_link("Go on #{@ferriswheel.name}")
    expect(current_path).to eq("/attractions/2")
  end

  it 'prevents users from editing/deleting a ride on the show page' do
    click_link('See attractions')
    click_link("Go on #{@ferriswheel.name}")
    expect(page).to_not have_content("edit")
    expect(page).to_not have_content("delete")
  end

  it "has a button from the attraction show page to go on the ride" do
    click_link('See attractions')
    click_link("Go on #{@ferriswheel.name}")
    expect(current_path).to eq("/attractions/2")
    expect(page).to have_button("Go on this ride")
  end

#  it "clicking on 'Go on ride' redirects to user show page" do
#    click_link('See attractions')
#    click_link("Go on #{@ferriswheel.name}")
#    click_button("Go on this ride")
#    expect(current_path).to eq("/users/1")
#  end


end
