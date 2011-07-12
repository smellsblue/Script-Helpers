module ScriptHelpers
  class InstallGenerator < ::Rails::Generators::Base
    def create_database
      application_layout = "app/views/layouts/application.html.erb"
      return unless File.exist?(application_layout)
      application_layout_contents = File.read application_layout
      modified_application_layout = false

      unless application_layout_contents.include?("<%= script_contents %>") || application_layout_contents.include?("<%= script_tag_contents %>")
        gsub_file application_layout, /<\/body>/, "<%= script_tag_contents %>\n<%= script_contents %>\n</body>"
        modified_application_layout = true
      end

      unless application_layout_contents.include?("<%= css_contents %>") || application_layout_contents.include?("<%= css_tag_contents %>")
        gsub_file application_layout, /<\/head>/, "  <%= css_tag_contents %>\n  <%= css_contents %>\n</head>"
        modified_application_layout = true
      end

      # Since gsub_file doesn't ask the user, just inform user that the file was overwritten.
      puts "       force  #{application_layout}" if modified_application_layout
    end
  end
end
