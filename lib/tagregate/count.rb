module Tagregate
  class Count
    def initialize(step_mother, io, options)
      @io = io
      @aggregate = {}
    end

    def after_tags(tags)
      tags.tags.each do |tag|
        @aggregate[tag.name] ||= 0
        @aggregate[tag.name] = @aggregate[tag.name] + 1
      end
    end

    def after_features(whatever)
      keys = @aggregate.keys.sort
      keys.each do |k|
        @io.puts "#{k.ljust(50, " ")} #{@aggregate[k]}"
      end
    end
  end
end
