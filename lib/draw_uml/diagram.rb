require 'open3'

module DrawUml
  class Diagram
    def initialize(path)
      @path = path
      FileUtils.mkdir_p(@path)
    end

    def create(file)
      raw = File.read(file)
      filename = File.basename(file, '.*')
      cmd = 'plantuml -pipe > ' + File.join(@path, filename + '.png')
      stdout, status = Open3.capture2(cmd, stdin_data: raw)
    end
  end
end
