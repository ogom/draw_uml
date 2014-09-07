require 'open3'

module DrawUml
  class Diagram
    def self.create
      file = File.read(File.expand_path('sequence.md', './doc/uml'))
      path = File.expand_path('sequence.png', './public/images/draw-uml')

      cmd = "plantuml -pipe > #{path}"
      stdout, status = Open3.capture2(cmd, stdin_data: file)
    end
  end
end
