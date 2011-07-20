module ScriptHelpers
  module HelperAdditions
    def script(options = {}, &block)
      if options.include? :src
        @_script_helpers_script ||= {}

        unless @_script_helpers_script[options[:src]]
          @_script_helpers_script[options[:src]] = true
          content_for :script_tags, "\n#{javascript_include_tag options[:src]}".html_safe
        end
      end

      if block
        return javascript_tag &block if options[:inline]
        content_for :script, "\n#{capture &block}".html_safe
      end

      nil
    end

    def script_tag_contents
      content_for :script_tags
    end

    def script_contents
      contents = content_for :script

      if contents
        javascript_tag do
          contents
        end
      end
    end

    def css(options = {}, &block)
      if options.include? :src
        @_script_helpers_css ||= {}

        unless @_script_helpers_css[options[:src]]
          @_script_helpers_css[options[:src]] = true
          content_for :css_tags, "\n#{stylesheet_link_tag options[:src]}".html_safe
        end
      end

      if block
        content_for :css, "\n#{capture &block}".html_safe
      end
    end

    def css_tag_contents
      content_for :css_tags
    end

    def css_contents
      contents = content_for :css

      if contents
        "<style type=\"text/css\">#{contents}</style>".html_safe
      end
    end
  end
end

module ApplicationHelper
  include ScriptHelpers::HelperAdditions
end
