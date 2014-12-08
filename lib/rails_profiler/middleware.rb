require 'rails_profiler/profiler'

module RailsProfiler
  class Middleware
    @@previous_page_id = 0
    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      if(skip_request?(request))
        status,headers,body = @app.call(env)
        return [status,headers,body]
      end
      if request.cookies['rails-profiler-page-id'] != @@previous_page_id
        @@previous_page_id = request.cookies['rails-profiler-page-id']
        Profiler.clear_results
      end
      status, headers, body = nil
      Profiler.profile(request) do
        status,headers,body = @app.call(env)
      end
      [status, headers, body]
    end

    # Skip all rails_profiler related request from profiling
    def skip_request?(request)
      case request.path
      when '/rails_profiler/result.json'
        return true
      when '/rails_profiler/widget'
        return true
      else
        return false
      end
    end
  end
end
