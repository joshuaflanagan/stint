module Stint
  class Project
    attr_accessor :repo

    def initialize(repo)
      @repo = repo
    end
  end
end
