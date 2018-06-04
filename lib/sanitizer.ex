defmodule Lectura.Sanitizer do
  defmodule LecturaScrubber do
    require HtmlSanitizeEx.Scrubber.Meta
    alias HtmlSanitizeEx.Scrubber.Meta

    Meta.remove_cdata_sections_before_scrub()
    Meta.strip_comments()

    Meta.allow_tag_with_these_attributes("html", [])
    Meta.allow_tag_with_these_attributes("head", [])
    Meta.allow_tag_with_these_attributes("title", [])
    Meta.allow_tag_with_these_attributes("body", [])

    Meta.allow_tag_with_uri_attributes("a", ["href"], ["http", "https", "mailto"])
    Meta.allow_tag_with_these_attributes("a", ["name", "title"])

    Meta.allow_tag_with_these_attributes("b", [])
    Meta.allow_tag_with_these_attributes("blockquote", [])
    Meta.allow_tag_with_these_attributes("br", [])
    Meta.allow_tag_with_these_attributes("code", ["class"])
    Meta.allow_tag_with_these_attributes("del", [])
    Meta.allow_tag_with_these_attributes("em", [])
    Meta.allow_tag_with_these_attributes("h1", [])
    Meta.allow_tag_with_these_attributes("h2", [])
    Meta.allow_tag_with_these_attributes("h3", [])
    Meta.allow_tag_with_these_attributes("h4", [])
    Meta.allow_tag_with_these_attributes("h5", [])
    Meta.allow_tag_with_these_attributes("hr", [])
    Meta.allow_tag_with_these_attributes("i", [])
    Meta.allow_tag_with_uri_attributes("img", ["src"], ["http", "https", "mailto"])
    Meta.allow_tag_with_these_attributes("img", ["width", "title", "alt"])
    Meta.allow_tag_with_these_attributes("li", [])
    Meta.allow_tag_with_these_attributes("ol", [])
    Meta.allow_tag_with_these_attributes("p", [])
    Meta.allow_tag_with_these_attributes("pre", [])
    Meta.allow_tag_with_these_attributes("span", [])
    Meta.allow_tag_with_these_attributes("strong", [])
    Meta.allow_tag_with_these_attributes("table", [])
    Meta.allow_tag_with_these_attributes("u", [])
    Meta.allow_tag_with_these_attributes("ul", [])

    Meta.strip_everything_not_covered()
  end

  def remove_useless_tags(html_markup) do
    html_markup
    |> Floki.filter_out("footer")
    |> Floki.filter_out("script")
    |> Floki.filter_out("style")
    |> Floki.filter_out("svg")
    |> Floki.filter_out("nav")
    |> Floki.filter_out("aside")
    |> Floki.filter_out("i")
    |> Floki.filter_out(".js-stickyFooter")
    |> Floki.filter_out(".js-postMetaLockup")
    |> Floki.filter_out(".metabar")
    |> Floki.raw_html()
  end

  def convert_hrefs_to_absolute(html_markup, url) do
    html_markup
    |> String.replace("href=\"/\"", "href=\"#{url}/\"")
    |> String.replace("src=\"/\"", "src=\"#{url}/\"")
  end

  def sanitize(html_markup, url) do
    sanitized_markup =
      html_markup
      |> remove_useless_tags
      |> String.replace("&gt;", ">")
      |> String.replace("&lt;", "<")
      |> HtmlSanitizeEx.Scrubber.scrub(LecturaScrubber)
      |> convert_hrefs_to_absolute(url)

    {:ok, sanitized_markup}
  end
end
