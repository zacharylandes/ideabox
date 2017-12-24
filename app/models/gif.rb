class Gif < ApplicationRecord
  has_and_belongs_to_many :ideas, :dependent => :destroy
end
