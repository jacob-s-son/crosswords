require 'spec_helper.rb'

describe Crosswords::Dictionary do
  let(:second_two_words_level_keys) { ['A','B','D','E','G','H','I','L','M','N','R','S','T','W','X','Y'] }

  before(:all) do
    #FIXME: need a better way to specify dictionary path
    @dictionary = klass.new("/Users/ejekabsons/Workspace/dictionary/dict.txt")
  end

  describe "#size" do
    it "should show loaded number of words" do
      expect( @dictionary.size ).to eq( 178691 )
    end
  end

  describe "#dictionary" do
    it "should be grouped on first level by number of letters in word" do
      expect( @dictionary.dictionary['5'].keys ).to eq ('A'..'Z').to_a # 5 letter words
    end

    it "on second plus level should be grouped by letter" do
      expect( @dictionary.dictionary['2']['A'].keys ).to eq second_two_words_level_keys
    end
  end

  describe "#find" do
    context "when found" do
      it "should return word" do
        expect( @dictionary.find( "BILK" ) ).to eq 'BILK'
      end
    end

    context "when not found" do
      it "should return nil" do
        expect( @dictionary.find( "AHFYBBD" ) ).to be_nil
      end
    end
  end
end