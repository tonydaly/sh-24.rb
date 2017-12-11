class UsersController < ApplicationController
  def show
    @result = Github::GetRepos.new(username: params[:username]).call

    unless @result.success?
      render :show, error: @result.error and return
    end

    @sorted_langs = Github::FavLangSorter.new(@result.repos).call
  end
end
