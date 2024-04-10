class TryonforclientController < ApplicationController
  def index
    tryonforclient = Tryonforclient.new
    @stores = tryonforclient.stores
    @items = tryonforclient.items
  end
end