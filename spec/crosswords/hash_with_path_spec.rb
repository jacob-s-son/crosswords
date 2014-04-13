require 'spec_helper.rb'

describe Crosswords::HashWithPath do
  describe "#deep_merge" do
    let(:hsh1) {
      klass[
        'A' => klass[ 'A' => 'AA', 'B' => 'AB' ]
      ]
    }

    let(:hsh2) {
      klass[
        'A' => klass[ 'G' => 'AG', 'M' => 'AM' ]
      ]
    }

    it "should merge nested hashes" do
      expect( hsh1.deep_merge(hsh2) ).to eq(klass[
        'A' => klass[ 'A' => 'AA', 'B' => 'AB', 'G' => 'AG', 'M' => 'AM' ]
      ])
    end
  end

  describe "#traverse_path" do
    subject {
      klass[
        '2' => {
          'A' => {
            'A' => 'AA',
            'B' => 'AB',
            'D' => 'AD',
            'G' => 'AG'
          }
        }
      ]
    }

    context "path exists" do
      context "no seaparator specified" do
        it "should traverse through nested hash, with dots used as path separator" do
          expect( subject.traverse_path('2.A.B') ).to eq( 'AB' )
          expect( subject.traverse_path('2.A.G') ).to eq( 'AG' )
        end
      end

      context "seaparator specified" do
        it "should traverse through nested hash, with using specified path separator" do
          expect( subject.traverse_path('2/A/B', '/') ).to eq( 'AB' )
          expect( subject.traverse_path('2/A/G', '/') ).to eq( 'AG' )
        end
      end
    end

    context "path does not exist" do
      it "should return nil" do
        expect( subject.traverse_path('2.A.T')    ).to be_nil
        expect( subject.traverse_path('3.A.T.L')  ).to be_nil
      end
    end
  end
end