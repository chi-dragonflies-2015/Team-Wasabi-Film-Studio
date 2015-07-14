require 'rails_helper'

before(:all) do
  DatabaseCleaner.strategy = :transaction
end

before(:each) do
  DatabaseCleaner.start
  @user = FactoryGirl.build(:user)
end

after(:each) do
  DatabaseCleaner.clean
end

RSpec.feature 'User visiting site', type: :feature do
  xscenario 'When user visits the main page' do
    visit '/'

    expect(page).to have_text("Welcome to Smiling Wasabi!")
    expect(page.all('.genre-tag').empty?).to be(false)
    expect(page.all('.genre-tag .movie').empty?).to be(false)
  end

  scenario 'When user clicks the Signup link' do
    visit '/'
    click_link 'signup_link'

    expect(current_path).to eq(signup_path)
  end
end

RSpec.feature 'User Signs up', type: :feature do
  scenario 'with valid email and password' do
    visit signup_path
    sign_up_with(@user.name, @user.email, @user.password)

    expect(current_path).to eq(root_path)
  end

  xscenario 'with invalid email' do
    visit signup_path
    sign_up_with(name, email, password)

    # write expect stuff
  end

  xscenario 'with blank password' do
    visit signup_path
    sign_up_with(name, email, password)

    # write expect stuff
  end
end