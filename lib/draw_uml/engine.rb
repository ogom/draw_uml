require 'rack'
require 'erb'

module DrawUml
  class Engine
    class << self
      def call(env)
        params = Rack::Request.new(env).params
        id = params['id'].to_i ||= 0

        diagram = DrawUml::Diagram.new(DrawUml::Configure.dest_path)
        diagram.create(DrawUml::Configure.source_file[id])

        files = DrawUml::Configure.source_file.map { |file| File.basename(file, '.*') }
        path = File.join(DrawUml::Configure.image_path, files[id] + '.png')

        erb = ERB.new(DrawUml::Configure.application_template)
        body = erb.result(binding)

        status = 200
        headers = {'Content-Type' => 'text/html'}
        [status, headers, [body]]
      end
    end
  end
end
