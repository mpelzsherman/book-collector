require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'home page' do
  describe "GET /" do
    it "should display my list of books" do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      book = FactoryGirl.create(:book)
      book.user = user
      book.save
      visit root_path
      page.should have_css('div.booklist')
    end
  end

  describe "GET / no books" do
    it "should NOT display my list of books" do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit root_path
      page.should_not have_css('div.booklist')
      page.should have_css('div.empty_booklist')
    end
  end

end