require 'spec_helper.rb'

describe Crosswords::Grid do
  describe "#new" do
    let(:n)       { 10          }
    let(:grid)    { klass.new(n) }
    let(:letters) { ('A'..'Z').to_a }

    let(:matrix) {
      [
        ['A', 'B', 'C'],
        ['B', 'A', 'C'],
        ['C', 'B', 'A']
      ]
    }

    let(:reverse_matrix) {
      [
        ['A', 'B', 'C'],
        ['B', 'A', 'B'],
        ['C', 'C', 'A']
      ]
    }

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

    describe ".generate_from_matrix" do
      it "should generate rows from matrix" do
        gen_grid = klass.generate_from_matrix( matrix )

        expect( gen_grid.rows ).to eq(matrix)
      end

      it "should generate columns from matrix" do
        gen_grid = klass.generate_from_matrix( matrix )

        expect( gen_grid.columns ).to eq(reverse_matrix)
      end
    end
  end
end