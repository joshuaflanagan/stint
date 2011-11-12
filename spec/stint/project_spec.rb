require 'spec_helper'

describe Stint::Project do
  before :each do
    @project = Stint::Project.new 'githublogin/reponame'
  end

  it "should be associated with a single repository" do
    @project.repo.should == 'githublogin/reponame'
  end

  describe "#phases" do
    before :each do
      github = double(Stint::GitHub.new(nil))
      github.stub(:labels) do
        [
          {"name" => '2-Working'},
          {"name" => '1 Waiting'},
          {"name" => 'Negotiate'},
          {"name" => '4Profit'}
        ]
      end
      @project.github = github
      @phases = @project.phases
    end

    it "should include all GitHub Issue labels prefixed with numbers" do
      @phases.should include('1 Waiting')
      @phases.should include('2-Working')
      @phases.should include('4Profit')
    end

    it "should not include GitHub Issues without a numeric prefix" do
      @phases.should_not include('Negotiate')
    end

    it "should sort the labels in numeric order" do
      @phases.should == ['1 Waiting', '2-Working', '4Profit']
    end
  end
end
