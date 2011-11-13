require 'spec_helper'

describe "Stint integration tests" do
  before :each do
    @project = Stint::Project.new 'joshuaflanagan/stint_test'
  end

  it "should retrieve the phases from the test project" do
    @project.phases.should == ['1 Waiting', '2-Working', '4Profit', '5 - Eval']
  end
end
