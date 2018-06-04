defmodule Lectura.Download do
  @moduledoc """
  Module used to download HTML markup for any given URL.
  """

  @doc """
  Downloads HTML markup for any URL. It will follow any redirect
  status codes automatically and fetch the final markup.

  ## Examples

      iex> Lectura.Download.get_url("http://github.com")
      {:ok, "<html>...</html>"}
  """
  @spec get_url(binary) :: {:ok, binary} | {:error, binary}
  def get_url(url) when is_binary(url) and byte_size(url) > 0 do
    case HTTPoison.get(url, [], follow_redirect: true) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Page does not exist"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  def get_url(_), do: {:error, "You must provide a valid URL"}
end
