class RepositoriesController < ApplicationController

  def search

  end

  def github_search
     @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'ca9149ceac35f817292c'
        req.params['client_secret'] = 'c618afc9b98cbd0e71f4304b6c7d5d7c7118a3ec'
        req.params['q'] = params[:query]
     end
     body_hash = JSON.parse(@resp.body)
     @repos = body_hash["items"]
     render 'search'
  end
end
