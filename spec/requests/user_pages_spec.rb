require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "index" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in user
      visit users_path
    end

    it { should have_selector('h1', :count => 1) }
    it { should have_title('All users') }
    it { should have_content('All users') }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.username) }
    it { should have_title(user.username) }
  end

  describe "signup page" do
  	before { visit signup_path }

  	it { should have_selector('h1', :count => 1) }
  	it { should have_content('Sign up') }
  	it { should have_title('Sign up') }
  end
end
