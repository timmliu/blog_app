require 'spec_helper'

describe "StaticPages" do

	describe "Home page" do

		it "should have the content 'Blog App'" do
			visit '/static_pages/home'
			expect(page).to have_selector('h1', :count => 1)
			expect(page).to have_content('Blog App')
		end
	end

	describe "About page" do

		it "should have the content 'About page'" do
			visit '/static_pages/about'
			expect(page).to have_selector('h1', :count => 1)
			expect(page).to have_content('About page')
		end
	end

	describe "Contact page" do

		it "should have the content 'Contact page'" do
			visit '/static_pages/contact'
			expect(page).to have_selector('h1', :count => 1)
			expect(page).to have_content('Contact page')
		end
	end

	describe "Help page" do

		it "should have the content 'Help page'" do
			visit '/static_pages/help'
			expect(page).to have_selector('h1', :count => 1)
			expect(page).to have_content('Help page')
		end
	end
end
