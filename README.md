# Lectura

## What is this?

* "Hey, I would like to embed the content from this URL on my page in a div."
* "I need to grab the markup for this URL and pass it to my billion-dollar machine learning algorithms"
* "I want to put the content from these websites on the blockchain for some unholy reason"

Did any of these apply to you? Good news! Lectura can help you!

## Examples

This is still a WIP and **not** production ready. Please don't use it yet except to
play around with it. Several edge cases and more tests need to be written.

I also need to try it out with many many more different sites and fix any holes.

```
Lectura.get_content("https://sergiotapia.me/killing-all-socket-connections-for-a-user-in-phoenix-framework-915148e98186")
# {:ok, binary_html_content}

Lectura.get_content("http://www.miamiherald.com/news/weather/article212464324.html")
# {:ok, binary_html_content}

Lectura.get_content("http://sergiotapia.me/some-random-404-page-non-exist")
# {:error, "Page does not exist"}
```

## How does it work?

Will write about this later.

## How fast is it?

TODO - Will measure later.

## Hey your package returns horrible results for SPECIFIC_URL!

Please open a Github issue, I'll fix it.

## Can you add THIS_FEATURE?

Maybe! Open a Github issue, I would love to keep this library laser focused so we'll see.
