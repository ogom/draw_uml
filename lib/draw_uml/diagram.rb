require 'open3'

module DrawUml
  class Diagram
    def initialize(path)
      @path = path
      FileUtils.mkdir_p(@path)
    end

    def create(path)
      file = File.join(@path, path + '.png')
      raw = File.read(File.join(config.source_path, path + '.' + config.diagram_extension))
      FileUtils.mkdir_p(File.dirname(file))

      cmd = 'plantuml -pipe > ' + file
      stdout, status = Open3.capture2(cmd, stdin_data: raw)
    end

    def config
      DrawUml::Configure
    end
  end
end
