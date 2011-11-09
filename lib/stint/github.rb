require 'rubygems'
require 'httparty'

module HTTParty
  class Request
    def path=(uri)
      @path = URI.parse(URI.escape(uri))
    end
  end
end

module Stint
  class GitHub
    include HTTParty
    base_uri "https://api.github.com"
    format :json

    def initialize(repo, user_token = nil)
      @repo = repo
      @user_token = user_token
    end

    def labels
      options = {}.merge(auth_options)
      self.class.get("/repos/#{@repo}/labels", options)
    end

    def issues(options = {})
      allowed_options = [:milestone, :labels]
      query = options.select{|k,v| allowed_options.include? k}
      opts = {}.merge(auth_options)
      opts[:query] = query if query.any?
      self.class.get("/repos/#{@repo}/issues", opts)
    end

    private
    def auth_options
      @auth_options ||= @user_token.nil? ? {} : { :headers => {"Authorization" => "token #{@user_token}"}}
    end
  end
end
