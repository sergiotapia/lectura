defmodule Lectura do
  @moduledoc """
  Documentation for Lectura.
  """

  @doc """
  Parses out meta information from an HTML body, like description,
  title, author, and more.

  ## Examples

      iex> Lectura.meta_information("<html>....</html>")
      {:ok, %{}}
  """
  def meta_information(html_body) do
  end

  @doc """
  Parses relevant content from an HTML body by removing unecesary clutter
  like ads, navigation, footers, and more.

  ## Examples

      iex> Lectura.content("<html>....</html>")
      {:ok, "<p>content</p>"}
  """
  def content(html_body) do
  end
end
