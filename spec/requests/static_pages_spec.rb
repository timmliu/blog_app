require 'spec_helper'

describe "StaticPages" do

	describe "Home page" do

		it "should have the content 'Blog App'" do
			visit root_path
			expect(page).to have_selector('h1', :count => 1)
			expect(page).to have_content('Blog App')
		end
	end

	describe "About page" do

		it "should have the content 'About page'" do
			visit about_path
			expect(page).to have_selector('h1', :count => 1)
			expect(page).to have_content('About page')
		end
	end

	describe "Contact page" do

		it "should have the content 'Contact page'" do
			visit contact_path
			expect(page).to have_selector('h1', :count => 1)
			expect(page).to have_content('Contact page')
		end
	end

	describe "Help page" do

		it "should have the content 'Help page'" do
			visit help_path
			expect(page).to have_selector('h1', :count => 1)
			expect(page).to have_content('Help page')
		end
	end
end
