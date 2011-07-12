# Summary

ScriptHelpers is a gem for Rails 3 that provides some convenient
helpers for including JavaScript and CSS in your views.

# Install

Just add the following to your Gemfile and bundle:

    gem "script_helpers"

Then run:

    rails generate script_helpers:install

That will add a few helper calls to your application.html.erb layout.
Specifically:

* script_tag_contents: This helper will return the contents of all the
  included script tags (ie, calls to script :src => "custom.js").

* script_contents: This helper will return an embedded script tag with
  all the script blocks in your view.  It will return nil if there are
  no script blocks to embed.

* css_tag_contents: Like script_tag_contents, this will return the
  contents of all the included css tags (ie, calls to css :src =>
  "custom.css").

* css_contents: Like script_contents, this will return an embedded
  style tag with all the css blocks in your view.  It will return nil
  if there are no css blocks to embed.

Feel free to move these around after installing.

# Usage

After installing, you can use 2 helpers in your views... script and css.

If you want to add content to the overall page script, which will be
embedded at the bottom of the page if you do not move the helper calls
after installing, you can do the following:

    <% script do %>
      alert("I am a script!");
    <% end %>

Sometimes it is important to execute a specific script block right
after a certain batch of HTML.  In that case, use the inline option:

    <% script :inline => true do %>
      alert("I am an inline script!");
    <% end %>

If you want to add a script file to the block of scripts, you can use
the :src option:

    <% script :src => "myScript.js" %>

Similarly, the css helper allows block content:

    <% css do %>
      .foo { color: red; }
    <% end %>

Or including a file:

    <% css :src => "myStyling.css" %>

Though, inline styles are not supported right now, as they should
probably go with all the rest of your styling.
