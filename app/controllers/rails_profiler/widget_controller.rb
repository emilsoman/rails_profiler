require 'rails_profiler/profiler'
class RailsProfiler::WidgetController < RailsProfiler::ApplicationController
  def index
  end

  def result
    render json: RailsProfiler::Profiler.result
  end
end
