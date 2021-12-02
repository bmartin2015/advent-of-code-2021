IO.puts("Day 1 - Part 2")
IO.puts("Reading File...")

input =
  "input.txt"
  |> File.read!()
  |> String.split("\n")
  |> Enum.map(&String.to_integer/1)

{total, _last, _list} = Enum.reduce_while(input, {0, 0, input}, fn _x, {count, last, list} ->

  if length(list) < 3, do: {:halt, {count, last, list}}

  sum = list |> Enum.take(3) |> Enum.sum()
  [_head | tail] = list

  if last == 0 do
    IO.puts("#{sum} - (N/A - no previous sum")
    {:cont, {0, sum, tail}}
  else if sum > last do
    IO.puts("#{sum} (increased)")
    {:cont, {count + 1, sum, tail}}
  else
    IO.puts("#{sum} (decreased)")
    {:cont, {count, sum, tail}}
  end
end
end)

# acc = {head, 0}

# {_last, total} = Enum.reduce(tail, {head, 0}, fn depth, {last, count} ->
#   if depth > last do
#     IO.puts("#{depth} (increased)")
#     {depth, count + 1}
#   else
#     IO.puts("#{depth} (decreased)")
#     {depth, count}
#   end
# end)

IO.puts("Total: #{total}")
