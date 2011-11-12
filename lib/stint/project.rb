module Stint
  class Project
    attr_accessor :repo
    attr_writer :github

    def initialize(repo)
      @repo = repo
    end

    def github
      @github ||= GitHub.new(@repo)
    end

    def phases
      issue_names = github.labels.map{|l| l["name"]}
      issue_names.select {|n| n =~ /^[0-9]/}.sort
    end
  end
end
