class Book < ActiveRecord::Base
  attr_accessible :author, :title
  belongs_to :user
end
