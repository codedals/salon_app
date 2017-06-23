class SiteController < ApplicationController
  def index
  end

  def salons
    @salons = Salon.all
  end
end
