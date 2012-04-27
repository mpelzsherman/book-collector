require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'home page' do
  describe "GET /" do
    it "should display my list of books" do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      FactoryGirl.create(:book)
      visit root_path
      save_and_open_page
      page.should have_css('div.booklist')
    end
  end

end