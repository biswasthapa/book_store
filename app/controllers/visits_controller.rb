class VisitsController < ApplicationController
  def index
    @visits = Visit.where(user_id: nil)
  end
end
