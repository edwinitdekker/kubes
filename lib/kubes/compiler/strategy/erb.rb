require "deep_merge/rails_compat"
require "render_me_pretty"

class Kubes::Compiler::Strategy
  class Erb < Base
    extend Kubes::Compiler::Dsl::Core::FieldMethods
    include Kubes::Compiler::Dsl::Core::Helpers
    include Kubes::Compiler::Shared::Helpers

    def run
      data = render(@path)
      layers.each do |path|
        layer = render(path)
        data.deeper_merge!(layer)
      end
      yaml = YAML.dump(data)
      Result.new(@save_file, yaml)
    end

    def render(path)
      if File.exist?(path)
        yaml = RenderMePretty.result(path, context: self)
        result = YAML.load(yaml)
        result.is_a?(Hash) ? result : {} # in case of blank yaml doc a Boolean false is returned
      else
        {}
      end
    end
  end
end
