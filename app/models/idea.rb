class Idea < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :images, :dependent => :nullify
  has_and_belongs_to_many :gifs, :dependent => :nullify
  has_and_belongs_to_many :nytimes, :dependent => :nullify
end
