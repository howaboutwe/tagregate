require "spec_helper"

describe Tagregate::File do
  let(:file) { Tagregate::File.new("foo", STDOUT, {}) }

  let(:feature) { double(Cucumber::Ast::Feature) }
  let(:tags) { double(Cucumber::Ast::Tags) }

  let(:io) { file.instance_variable_get(:@io) }
  let(:summary) { file.instance_variable_get(:@summary) }

  describe "#initialize" do
    it "sets an instance variable for writing" do
      io.should == STDOUT
    end

    it "sets a summary instance variable to an empty hash" do
      summary.should == {}
    end
  end

  describe "#before_feature" do
    before { feature.stub!(:file).and_return("features/foo.feature") }

    it "sets the current file to the provided feature file" do
      file.before_feature(feature)

      file.instance_variable_get(:@current_file).should ==
        "features/foo.feature"
    end
  end

  describe "#after_tags" do
    before do
      tags.stub!(:tags).and_return([stub(name: "Foo")])
    end

    it "adds to summary each tag and its files" do
      summary.should == {}

      file.after_tags(tags)

      summary.keys.should include("Foo")
    end
  end
end
