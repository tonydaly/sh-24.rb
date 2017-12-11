module Github
  class GetRepos
    def initialize(username:)
      @username = username
    end

    def call
      begin
        repos = Octokit.repos @username
      rescue StandardError => e
        OpenStruct.new(success?: false, repos: repos, error: e)
      else
        OpenStruct.new(success?: true, repos: repos, error: nil)
      end
    end
  end
end
