require 'open3'

module DrawUml
  class Diagram
    def initialize(path)
      @path = path
      FileUtils.mkdir_p(@path)
    end

    def create(source_path, dest_path)
      raw = File.read(source_path)
      digest = Digest::MD5.hexdigest(raw)

      tmp_file = File.join(@path, dest_path + ".#{digest}.tmp")
      unless File.exist?(tmp_file)
        png_file = File.join(@path, dest_path + '.png')
        FileUtils.mkdir_p(File.dirname(png_file))

        cmd = 'plantuml -pipe > ' + png_file
        stdout, status = Open3.capture2(cmd, stdin_data: raw)

        files = Dir[File.join(@path, dest_path + ".*.tmp")]
        File.unlink(*files)
        File.write(tmp_file, nil)
      end
    end
  end
end
