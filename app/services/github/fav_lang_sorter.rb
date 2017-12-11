module Github
  class FavLangSorter
    def initialize(repos)
      @repos = repos
    end

    def call
      repos_count = @repos.reduce(Hash.new(0)) { |acc, repo| acc[repo.language] += 1; acc }
      Hash[repos_count.sort_by{ |k, v| v }.reverse]
    end
  end
end
