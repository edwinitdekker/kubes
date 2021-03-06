module Kubes
  module Core
    extend Memoist

    def env
      ENV['KUBES_ENV'] || "dev"
    end

    def root
      ENV['KUBES_ROOT'] || Dir.pwd
    end

    def configure(&block)
      Config.instance.configure(&block)
    end

    def config
      Config.instance.load_configs
      Config.instance.config
    end
    memoize :config

    def logger
      config.logger
    end
    memoize :logger

    def kustomize?
      Kubectl::Kustomize.detect?
    end

    def check_project!
      return if File.exist?("#{Kubes.root}/.kubes/config.rb")
      logger.error "ERROR: It doesnt look like this is a kubes project. Are you sure you are in a kubes project?".color(:red)
      ENV['TS_TEST'] ? raise : exit(1)
    end
  end
end
