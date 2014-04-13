require 'spec_helper.rb'

describe Crosswords::WordFinder do
  let(:matrix) {
    [
      ['A', 'B', 'A'],
      ['B', 'A', 'G'],
      ['C', 'A', 'B']
    ]
  }

  let(:grid)        { Crosswords::Grid.generate_from_matrix( matrix ) }

  before(:all) do
    #FIXME: need a better way to specify dictionary path
    @dictionary = Crosswords::Dictionary.new("/Users/ejekabsons/Workspace/dictionary/dict.txt")
  end

  describe "#find" do
    subject { klass.new( grid, @dictionary ) }

    context "horizontal" do
      context "left to right" do
        it "should find words 'AB', 'ABA', 'BA', 'BAG', 'AG', 'CAB'" do
          expect( subject.find('horizontal_from_the_left') ).to eq(
            Set.new ['AB', 'ABA', 'BA', 'BAG', 'AG', 'CAB']
          )
        end
      end

      context "right to left" do
        it "should find words 'AB', 'ABA', 'BA', 'GAB'" do
          expect( subject.find('horizontal_from_the_right') ).to eq(
            Set.new ['AB', 'ABA', 'BA', 'GAB']
          )
        end
      end
    end

    context "vertical" do
      context "top to bottom" do
        it "should find words 'AB', 'BA', 'BAA', 'AA', 'AG'" do
          expect( subject.find('vertical_from_the_top') ).to eq(
            Set.new ['AB', 'BA', 'BAA', 'AA', 'AG']
          )
        end
      end

      context "bottom to top" do
        it "should find words 'BA', 'AA', 'AB'" do
          expect( subject.find('vertical_from_the_bottom') ).to eq(
            Set.new ['BA', 'AA', 'AB']
          )
        end
      end
    end

    context "diagonal" do
      context "left to right" do
        it "should find words 'BA', 'AB', 'AA'" do
          expect( subject.find('diagonal_from_the_left') ).to eq(
            Set.new ['BA', 'AB', 'AA']
          )
        end
      end

      context "right to left" do
        it "should find words 'AB', 'BAA', 'BA', 'AA'" do
          expect( subject.find('diagonal_from_the_right') ).to eq(
            Set.new ['AB', 'BAA', 'BA', 'AA']
          )
        end
      end
    end
  end
end