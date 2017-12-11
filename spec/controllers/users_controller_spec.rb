require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:username) { 'tonydaly' }

  before do
    VCR.use_cassette("github/get_repos") do
      get :show, params: { username: username }
    end
  end

  it "assigns the sorted langs" do
    expect(assigns(:sorted_langs)).not_to be_nil
  end

  it "renders the :show template" do
    expect(response).to render_template(:show)
  end
end
