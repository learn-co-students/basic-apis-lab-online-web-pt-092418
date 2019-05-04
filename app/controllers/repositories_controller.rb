class RepositoriesController < ApplicationController

  def search
  end


  # baseURL = 'https://api.github.com'
  # search = '/search/repositories'

  def github_search
     # binding.pry
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'hide it from share'
      req.params['client_secret'] = 'hide it from share'
      req.params['q'] = params[:query]
    end

    @body = JSON.parse(@resp.body)
    @items = @body['items']

    render 'search'
  end


end #end of controller
