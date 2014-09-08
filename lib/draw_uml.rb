require 'pathname'

require_relative 'draw_uml/version'
require_relative 'draw_uml/configure'
require_relative 'draw_uml/default'
require_relative 'draw_uml/engine'
require_relative 'draw_uml/diagram'

module DrawUml
  class << self
    def configure
      yield DrawUml::Configure
    end

    def config
      DrawUml::Configure
    end

    def root
      @root ||= Pathname.new(File.expand_path('../', File.dirname(__FILE__)))
    end
  end
end

DrawUml::Configure.setup
