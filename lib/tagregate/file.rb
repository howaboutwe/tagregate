module Tagregate
  class File
    def initialize(step_mother, io, options)
      @io = io
      @summary = {}
    end

    def before_feature(feature)
      @current_file = feature.file
    end

    def after_tags(tags)
      tags.tag_names.each do |name|
        @summary[name] ||= []
        unless @summary[name].include? @current_file
          @summary[name] << @current_file
        end
      end
    end

    def after_features(whatever)
      keys = @summary.keys.sort
      keys.each do |k|
        @io.puts k
        @summary[k].each do |file_name|
          @io.puts "\t-#{file_name}"
        end
      end
    end
  end
end
