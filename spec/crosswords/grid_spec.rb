require 'spec_helper.rb'

describe Crosswords::Grid do
  describe "#new" do
    let(:n)       { 10          }
    let(:grid)    { klass.new(n) }
    let(:letters) { ('A'..'Z').to_a }

    it "should have N columns" do
      expect( grid.columns.size ).to eq(n)
    end

    it "should have N rows" do
      expect( grid.rows.size ).to eq(n)
    end

    it "should populate rows with letters" do
      expect( grid.rows.each { |c| letters.include?(c) } ).to be_true
    end

    it "should populate columns with letters" do
      expect( grid.columns.each { |c| letters.include?(c) } ).to be_true
    end

    it "should have the same letters in the first row as in the first cell of all columns" do
      expect( grid.rows[0] ).to eq( grid.columns.map { |c| c[0] } )
    end
  end
end