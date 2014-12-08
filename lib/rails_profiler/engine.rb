require 'rails_profiler/middleware'
module RailsProfiler
  class Engine < ::Rails::Engine
    isolate_namespace RailsProfiler

    initializer "rails_profiler.add_middleware" do |app|
      app.middleware.insert(0, RailsProfiler::Middleware)
    end
    if config.respond_to? (:assets)
      config.assets.precompile += %w{ rails_profiler.js rails_profiler.css rails_profiler_widget.js }
    end
    config.after_initialize do |app|
      app.routes.prepend do
        mount RailsProfiler::Engine => '/rails_profiler'
      end
    end
  end
end
