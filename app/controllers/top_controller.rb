class TopController < ApplicationController
  def index
    @parts = Part.all
  end
end
