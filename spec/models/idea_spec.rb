require 'rails_helper'

describe Idea, type: :model do
  describe "relationships" do
    it {should belong_to(:user)}
    it {should have_and_belong_to_many(:gifs)}
    it {should have_and_belong_to_many(:images)}
    it {should have_and_belong_to_many(:nytimes)}
  end
end
