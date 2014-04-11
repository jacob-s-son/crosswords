require 'spec_helper.rb'

describe Crosswords::Dictionary do
  #FIXME: need a better way to specify dictionary path
  let(:path)       { "/Users/ejekabsons/Workspace/dictionary/dict.txt" }
  let(:dictionary) { klass.new( path ) }

  describe "#size" do
    it "should show loaded number of words" do
      expect( dictionary.size ).to eq( 178691 )
    end
  end

  describe "#dictionary" do
    it "should be grouped on first level by number of letters in word" do
      expect( dictionary.dictionary[5].keys ).to eq ('A'..'Z').to_a # 5 letter words
    end

    it "should be grouped on second level by letter" do
      expect( dictionary.dictionary[2]['A'].first ).to eq 'AA'
    end
  end
end