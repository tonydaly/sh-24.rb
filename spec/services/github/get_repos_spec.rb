require 'rails_helper'

describe Github::GetRepos do
  let(:result) {
    VCR.use_cassette("github/get_repos") do
      Github::GetRepos.new(username: username).call
    end
  }

  context "with a valid username" do
    let(:username) { "tonydaly" }
    let(:result) {
      VCR.use_cassette("github/get_repos/success") do
        Github::GetRepos.new(username: username).call
      end
    }

    it "returns success" do
      expect(result.success?).to be true
    end

    it "does not return an error" do
      expect(result.error).to be_nil
    end

    it "returns the repos" do
      expect(result.repos).not_to be_empty
    end
  end

  context "with an invalid username" do
    let(:username) { "tonydalyfake" }
    let(:result) {
      VCR.use_cassette("github/get_repos/failure") do
        Github::GetRepos.new(username: username).call
      end
    }

    it "does not return success" do
      expect(result.success?).to be false
    end

    it "returns an error" do
        expect(result.error).to be_a Octokit::NotFound
    end
  end
end
