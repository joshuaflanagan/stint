require 'stint/project'

describe Stint::Project do
  it "should be associated with a single repository" do
    project = Stint::Project.new 'githublogin/reponame'
    project.repo.should == 'githublogin/reponame'
  end
end
