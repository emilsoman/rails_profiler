require 'objspace'

module RailsProfiler
  class Profiler
    @@result = {
      total_memory_growth: 0,
      total_wall_time: 0,
      total_cpu_time: 0
    }
    @@perform_gc = false

    class << self
      def set_result(url, measure, value)
        @@result[url] ||= {}
        @@result[url][measure] = value
      end

      def result
        @@result
      end

      def clear_results
        @@result = {}
      end

      def profile(request)
        url = request.url
        if /rp-gc=/ === request.query_string
          @@perform_gc = (/rp-gc=true/ === request.query_string)
        end
        GC.start if @@perform_gc
        prev_mem = ObjectSpace.memsize_of_all

        yield

        GC.start if @@perform_gc
        new_mem = ObjectSpace.memsize_of_all
        mem_growth = (new_mem - prev_mem)/1000000.0
        @@result[:total_memory_growth] ||= 0
        @@result[:total_memory_growth] += mem_growth
        if @@result[url] && @@result[url][:memory_growth]
          @@result[url][:memory_growth] += mem_growth
        else
          set_result(url, :memory_growth, mem_growth)
        end
      end
    end
  end
end
