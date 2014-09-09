require 'rack'
require 'erb'
require 'pp'

module DrawUml
  class Engine
    class << self
      def call(env)
        request = Rack::Request.new(env)
        id = request.params['id'].to_i ||= 0

        # root = DrawUml::Tree.create(DrawUml::Configure.source_path)
        # root.each do |node|
        # end

        diagram = DrawUml::Diagram.new(DrawUml::Configure.dest_path)
        diagram.create(DrawUml::Configure.source_file[id])

        files = DrawUml::Configure.source_file.map { |file| File.basename(file, '.*') }
        image_path = File.join(DrawUml::Configure.image_path, files[id] + '.png')

        erb = ERB.new(DrawUml::Configure.application_template)
        body = erb.result(binding)

        status = 200
        headers = {'Content-Type' => 'text/html'}
        [status, headers, [body]]
      end
    end
  end
end
