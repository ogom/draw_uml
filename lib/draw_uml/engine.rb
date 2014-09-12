require 'rack'
require 'erb'

module DrawUml
  class Engine
    class << self
      def call(env)
        @request = Rack::Request.new(env)
        id = @request.params['id'] ||= nil
        path = nil

        unless id.nil?
          diagram = DrawUml::Diagram.new(DrawUml::Configure.dest_path)
          diagram.create(id)
          path = File.join(DrawUml::Configure.image_path, id + '.png')
        end

        erb = ERB.new(DrawUml::Configure.application_template)
        body = erb.result(binding)

        status = 200
        headers = {'Content-Type' => 'text/html'}
        [status, headers, [body]]
      end

      private
        def diagrams
          @raw = ''
          branch(DrawUml::Tree.create(DrawUml::Configure.source_path))
          @raw
        end

        def branch(node)
          @raw += "<div style=\"padding-left: #{node.level}0px;\">\n"
          @raw += "<h3>#{node.name}</h3>\n"
          arr = []
          node.entries.each do |entry|
            if entry.leaf?
              arr << entry
            else
              branch(entry)
            end
          end
          @raw += "<ul>"
          @raw += arr.map do |entry|
            "<li><a href=#{@request.path}?id=#{entry.id}>#{entry.name}</a></li>"
          end.join("\n")
          @raw += "</ul></div>\n"
        end
      # end private
    end
  end
end
