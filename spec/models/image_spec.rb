
require 'rails_helper'

describe Image, type: :model do
  describe "relationships" do
    it {should have_and_belong_to_many(:ideas)}
  end
end
