
require 'rails_helper'

describe Gif, type: :model do
  describe "relationships" do
    it {should have_and_belong_to_many(:ideas)}
  end
end
