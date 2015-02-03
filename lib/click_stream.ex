defmodule ClickStream do
  require Record
  Record.defrecordp :wx, Record.extract(:wx, from_lib: "wx/include/wx.hrl")

  @title 'Click Stream'

  def start do
    wx    = :wx.new
    frame = :wxFrame.new(wx, -1, @title)
    :wxWindow.connect(frame, :close_window)
    :wxWindow.connect(frame, :motion)
    :wxFrame.show(frame)
    loop(frame)
    :wxFrame.destroy(frame)
  end

  def loop(frame) do
    receive do
      {:wx, _, _, _, {:wxMouse, :motion, x, y, _, _, _, _, _, _, _, _, _, _}} ->
        IO.puts "x: #{x}, y: #{y}"
        loop(frame) 
      {:wx, _, {:wx_ref, _, :wxFrame, []}, [], {:wxClose, :close_window}} ->
        IO.puts "closing..."
      _ ->
        loop(frame) 
    end
  end

end


