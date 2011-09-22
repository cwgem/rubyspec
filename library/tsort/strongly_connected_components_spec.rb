require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes.rb', __FILE__)

describe "Tsort#strongly_connected_components" do
  it "returns strongly connected components as an array of arrays of nodes" do
    h = TSortHash[{1=>[2, 3], 2=>[3], 3=>[]}]
    h.tsort
    h.strongly_connected_components.should == [[3], [2], [1]]
  end

  it "returns an array of arrays of nodes where cyclical dependencies are arrays with more than one element" do
    h = TSortHash[{1=>[2], 2=>[3, 4], 3=>[2], 4=>[]}]
    h.strongly_connected_components.map {|nodes| nodes.sort}.should == [[4], [2, 3], [1]]
  end
end
