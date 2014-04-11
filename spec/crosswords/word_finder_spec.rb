require 'spec_helper.rb'

describe Crosswords::WordFinder do
  let(:matrix) {
    [
      ['A', 'B', 'A'],
      ['B', 'A', 'G'],
      ['C', 'A', 'B']
    ]
  }

  let(:path)       { "/Users/ejekabsons/Workspace/dictionary/dict.txt" }
  let(:dictionary)  { Crosswords::Dictionary.new(path) }
  let(:grid)        { Crosswords::Grid.generate_from_matrix( matrix ) }

  describe "#find" do
    subject { klass.new( grid, dictionary ) }

    context "horizontal" do
      context "left to right" do
        it "should find words 'AB', 'ABA', 'BA', 'BAG', 'AG', 'CAB'" do
          expect( subject.find('horizontal_from_the_left') ).to eq(
            Set.new ['AB', 'ABA', 'BA', 'BAG', 'AG', 'CAB']
          )
        end
      end
    end

    context "vertical" do
      context "top to bottom" do
        it "should find words 'AB', 'ABA', 'BA', 'BAG', 'AG', 'CAB'" do
          expect( subject.find('vertical_from_the_top') ).to eq(
            Set.new ['AB', 'BA', 'BAA', 'AA', 'AG']
          )
        end
      end
    end
  end
end