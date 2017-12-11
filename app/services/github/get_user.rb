require "ostruct"

module Github
  class GetUser
    def initialize(user)
      @user = user
    end

    def call
      begin
        user = Octokit.user @user
      rescue StandardError => e
        OpenStruct.new(success?: false, user: user, error: e)
      else
        OpenStruct.new(success?: true, user: user, error: nil)
      end
    end
  end
end
