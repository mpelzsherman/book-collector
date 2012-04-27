require 'spec_helper'

describe Book do

  before :each do
      @book = Book.new(:title => 'Moby Dick', :author => 'Herman Melville')
      @book.save.should be_true
  end

  describe "#new" do
      it "takes title and author and returns a new Book object" do
          @book.should be_an_instance_of Book
          @book.title.should eql 'Moby Dick'
          @book.author.should eql 'Herman Melville'
      end
  end

  describe "#update" do
      it "changes title and author" do
          @book.update_attributes(:title => 'The Hobbit', :author => 'J.R.R. Tolkein')
          @book.title.should eql 'The Hobbit'
          @book.author.should eql 'J.R.R. Tolkein'
      end
  end

  describe "#delete" do
      it "deletes book" do
          @book.destroy
          lambda {Book.find(@book.id)}.should raise_error(ActiveRecord::RecordNotFound  )
      end
  end

end
