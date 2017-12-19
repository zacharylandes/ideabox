class Category < ApplicationRecord
  belongs_to :user, optional: true
  has_many :ideas, :dependent => :destroy
end
