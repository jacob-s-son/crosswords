require 'spec_helper.rb'

describe Dictionary::Grid do
  let(:grid) { Dictionary::Grid.new }

  describe "#test" do
    it "should return 'tests'" do
      expect( grid.test ).to eq 'test'
    end
  end
end