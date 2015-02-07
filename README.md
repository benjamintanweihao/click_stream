Click Stream
===========

Learning about [Streams](http://elixir-lang.org/docs/master/elixir/Stream.html) in Elixir. 

You can read about the blog post [here](http://benjamintan.io/blog/2015/02/05/how-to-build-streams-in-elixir-easily-with-stream-resource-awesomeness/).

This project creates a wXwidget window, and by moving the mouse, emits mouse coordinates. Here's a quick demo:

<iframe width="420" height="315" src="https://www.youtube.com/embed/wnI0z514jmA" frameborder="0" allowfullscreen></iframe>

## Playing Around

Start the project in `iex`:

```
% iex -S mix
```

In this example, two streams are created: 

* `ClickStream.create_stream_x` creates a stream that produces values that represent the x coordinates of the mouse.

* `ClickStream.create_stream_y` creates a steam that produces vlaues that represent the y coordinates of the mouse.

### Streams are lazy

```elixir
iex> stream = ClickStream.create_stream_x
#Function<25.29647706/2 in Stream.resource/3>
iex> stream |> Stream.filter(fn x -> x < 100 end) |> Enum.take 10
x: 376
x: 376
x: 376
x: 13
x: 13
x: 15
x: 16
x: 17
x: 18
x: 20
x: 21
x: 22
x: 22
[13, 13, 15, 16, 17, 18, 20, 21, 22, 22]
```

### Streams are composable

We can lazily zip collections together:

```elixir
iex> Stream.zip(ClickStream.create_stream_x, ClickStream.create_stream_y)
#Function<6.29647706/2 in Stream.zip/2>
iex> Stream.zip(ClickStream.create_stream_x, ClickStream.create_stream_y) |> Enum.take 10
x: 380
y: 144
x: 359
y: 147
x: 340
y: 150
x: 329
y: 153
x: 316
y: 157
x: 307
y: 160
x: 299
y: 160
x: 298
y: 156
x: 296
y: 154
x: 282
y: 148
[{380, 144}, {359, 147}, {340, 150}, {329, 153}, {316, 157},
 {307, 160}, {299, 160}, {298, 156}, {296, 154}, {282, 148}]
```

Streams are awesome!
