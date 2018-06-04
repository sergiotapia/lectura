defmodule Lectura.Parser do
  @moduledoc """
  Module used to extract content from HTML markup.

  We have custom parsers for specific websites and more are added
  all the time as the need fits.
  """

  def parse_content(_url, sanitized_content)
      when is_binary(sanitized_content) and byte_size(sanitized_content) > 0 do
    parsed_content =
      sanitized_content
      |> Floki.parse()
      |> Floki.find("body")
      |> Floki.raw_html()

    {:ok, parsed_content}
  end
end
