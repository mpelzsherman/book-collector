class Book < ActiveRecord::Base
  attr_accessible :author, :title
  belongs_to :user
  validates :title, :uniqueness => {:scope => :user_id,
                                    :message => "A book with that title is already in your collection.",
                                    :case_sensitive => false}
end
