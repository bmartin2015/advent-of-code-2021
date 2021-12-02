IO.puts("Day 2 - Part 1")
IO.puts("Reading File...")

mult = fn {x, y} -> x * y end

"input.txt"
|> File.read!()
|> String.split("\n")
|> Enum.map(fn x -> String.split(x, " ") end)
|> Enum.map(fn [x, y] -> [x, String.to_integer(y)] end)
|> Enum.reduce({0, 0}, fn
  ["forward", length], {distance, depth} -> {distance + length, depth}
  ["down", length], {distance, depth} -> {distance, depth + length}
  ["up", length], {distance, depth} -> {distance, depth - length}
end)
|> mult.()
|> IO.puts()
