defmodule Lectura do
  @moduledoc """
  Documentation for Lectura.
  """

  alias Lectura.{Download, Sanitizer, Parser}

  @doc """
  Parses relevant content from an HTML body by removing unecesary clutter
  like ads, navigation, footers, and more. It will returns only the
  interesting bits of the content.

  ## Examples

      iex> Lectura.get_content("https://github.com/sergiotapia/lectura")
      {:ok, "<html>...</html>"}
  """
  def get_content(url) when is_binary(url) and byte_size(url) > 0 do
    with {:download, {:ok, content}} <- {:download, Download.get_url(url)},
         {:sanitize, {:ok, sanitized_content}} <- {:sanitize, Sanitizer.sanitize(content, url)},
         {:parse, {:ok, parsed_content}} <- {:parse, Parser.parse_content(url, sanitized_content)} do
      {:ok, parsed_content}
    else
      {:download, {:error, reason}} ->
        {:error, reason}

      _ ->
        {:error, "Unhandled exception - consider opening a Github PR?"}
    end
  end

  def get_content(_), do: {:error, "Url must be a string"}

  @doc """
  Parses out meta information from an HTML body, like description,
  title, author, and more.

  ## Examples

      iex> Lectura.meta_information("<html>....</html>")
      {:ok, %{}}
  """
  def meta_information(html_body) do
    # TODO
  end
end
