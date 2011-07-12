module ScriptHelpers
  module HelperAdditions
    def script(options = {}, &block)
      if options.include? :src
        content_for :script_tags, "\n#{javascript_include_tag options[:src]}".html_safe
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
      javascript_tag do
        content_for :script
      end
    end

    def css(options = {}, &block)
      if options.include? :src
        content_for :css_tags, "\n#{stylesheet_link_tag options[:src]}".html_safe
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
