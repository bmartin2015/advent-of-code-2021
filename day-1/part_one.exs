IO.puts("Day 1 - Part 1")
IO.puts("Reading File...")

input =
  "input.txt"
  |> File.read!()
  |> String.split("\n")
  |> Enum.map(&String.to_integer/1)

[head | tail] = input

IO.puts("#{head} (N/A - no previous measurement)")

acc = {head, 0}

{_last, total} = Enum.reduce(tail, {head, 0}, fn depth, {last, count} ->
  if depth > last do
    IO.puts("#{depth} (increased)")
    {depth, count + 1}
  else
    IO.puts("#{depth} (decreased)")
    {depth, count}
  end
end)

IO.puts("Total: #{total}")
