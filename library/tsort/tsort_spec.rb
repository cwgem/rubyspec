require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes.rb', __FILE__)

describe "Tsort#tsort" do
  it "raises a TSort::Cyclic exception if there is a cycle" do
    h = TSortHash[{1=>[2], 2=>[3, 4], 3=>[2], 4=>[]}]
    lambda { h.tsort }.should raise_error(TSort::Cyclic)
  end
end
