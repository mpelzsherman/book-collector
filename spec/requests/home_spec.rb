require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'home page' do
  describe "GET /" do
    it "should display my list of books" do
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:book)
      login_as(user, :scope => :user)
      visit root_path
      page.should have_css('div.booklist')
    end
  end

end