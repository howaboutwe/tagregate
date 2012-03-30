require "spec_helper"

describe Tagregate::Count do
  let(:count) { Tagregate::Count.new("foo", STDOUT, {}) }
  let(:tags) { double(Cucumber::Ast::Tags) }

  let(:io) { count.instance_variable_get(:@io) }
  let(:aggregate) { count.instance_variable_get(:@aggregate) }

  before { tags.stub!(:tags).and_return([stub(name: "Foo")]) }

  describe "#initialize" do
    it "sets an io instance variable for writing" do
      io.should == STDOUT
    end

    it "sets an aggregate instance variable to an empty hash" do
      aggregate.should == {}
    end
  end

  describe "#after_tags" do
    it "aggregates the tags with a count of occurrences" do
      aggregate.should == {}

      count.after_tags(tags)

      aggregate.should == {"Foo" => 1}
    end
  end
end
