n = 1_000_000

win_count = 1..trunc(n)
            |> Enum.map(fn _ -> { Enum.random([1, 2, 3]), Enum.random([1, 2, 3]) } end)
            |> Enum.count(fn x -> x |> elem(0) === Enum.random([1, 2, 3]) end)

IO.puts("experiment #1 probability: #{win_count*100/n}")

win_count2 = 1..trunc(n)
            |> Enum.map(fn _ -> { Enum.random([1, 2, 3]), Enum.random([1, 2, 3]) } end)
            |> Enum.count(fn x -> elem(x, 0) === elem(x, 1) or elem(x, 1) === Enum.random(List.delete([1, 2, 3], elem(x, 0))) end)

IO.puts("experiment #2 probability: #{win_count2*100/n}")
