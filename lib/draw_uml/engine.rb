require 'rack'
require 'erb'

module DrawUml
  class Engine
    class << self
      def call(env)
        DrawUml::Diagram.create

        status = 200
        headers = {'Content-Type' => 'text/html'}

        file = File.read(File.expand_path('application.html.erb', './lib/templates/layouts'))
        path = File.join('images', 'draw-uml', 'sequence.png')
        erb = ERB.new(file)
        body = erb.result(binding)

        [status, headers, [body]]
      end
    end
  end
end
