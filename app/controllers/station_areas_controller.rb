class StationAreasController < ApplicationController

  # For all responses in this controller, return the CORS access control headers.
  after_filter :cors_set_access_control_headers
  
  has_scope :by_name

  def index
    @station_areas = apply_scopes(StationArea).all
  end

  def show
    @station_area = StationArea.find(params[:id])
  end
end

private

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end
