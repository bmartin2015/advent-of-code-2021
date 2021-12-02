IO.puts("Day 2 - Part 2")
IO.puts("Reading File...")

mult = fn {x, y, _z} -> x * y end

"input.txt"
|> File.read!()
|> String.split("\n")
|> Enum.map(fn x -> String.split(x, " ") end)
|> Enum.map(fn [x, y] -> [x, String.to_integer(y)] end)
|> Enum.reduce({0, 0, 0}, fn
  ["forward", length], {distance, depth, aim} -> {distance + length, depth + (aim * length), aim}
  ["down", length], {distance, depth, aim} -> {distance, depth, aim + length}
  ["up", length], {distance, depth, aim} -> {distance, depth, aim - length}
end)
|> mult.()
|> IO.puts()
