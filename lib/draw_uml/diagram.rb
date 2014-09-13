require 'open3'

module DrawUml
  class Diagram
    def initialize(path)
      @path = path
      FileUtils.mkdir_p(@path)
    end

    def create(source_path, dest_path)
      raw = File.read(source_path)
      file = File.join(@path, dest_path)
      FileUtils.mkdir_p(File.dirname(file))

      cmd = 'plantuml -pipe > ' + file
      stdout, status = Open3.capture2(cmd, stdin_data: raw)
    end
  end
end
