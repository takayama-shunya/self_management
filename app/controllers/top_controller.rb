class TopController < ApplicationController
  def index
    @date = Time.now
  end
end
