defmodule Lectura.DownloadTest do
  use ExUnit.Case

  describe "Lectura.Download.get_url/1" do
    test "downloads html markup for a given url" do
      {:ok, content} =
        Lectura.Download.get_url(
          "https://sergiotapia.me/generate-images-with-name-initials-using-elixir-and-imagemagick-374eca4d14ff"
        )

      assert String.length(content) > 0
    end

    test "follows 302 redirect and downloads html markup" do
      {:ok, content} = Lectura.Download.get_url("https://jigsaw.w3.org/HTTP/300/302.html")

      assert String.length(content) > 0
    end

    test "returns error for any url that does not return a 200 status code" do
      result = Lectura.Download.get_url("https://sergiotapia.me/oiajsfgiajsdjawf")
      assert result == {:error, "Page does not exist"}
    end

    test "fails when incorrect url is given" do
      result = Lectura.Download.get_url("")
      assert result == {:error, "You must provide a valid URL"}

      result = Lectura.Download.get_url(123)
      assert result == {:error, "You must provide a valid URL"}
    end
  end
end
