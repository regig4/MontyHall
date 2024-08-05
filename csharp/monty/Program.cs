Random rand = new();

const int N = 1_000_000;

var winCount = Enumerable.Range(0, N)
                         .Select(x => new
                         {
                             choice = rand.Next(0, 3),
                             prize = rand.Next(0, 3)
                         })
                         .Where(x => x.choice == x.prize)
                         .Count();

var winCount2 = Enumerable.Range(0, N)
                          .Select(x => new
                          {
                              choice = rand.Next(0, 3),
                              prize = rand.Next(0, 3)
                          })
                          .Select(x => new
                          {
                              prize = x.prize,
                              choice = x.prize == x.choice 
                                                    ? rand.GetItems([0, 1, 2], 1)[0] 
                                                    : rand.GetItems([x.choice, x.prize], 1)[0]
                          })
                          .Where(x => x.choice == x.prize)
                          .Count();


Console.WriteLine($"experiment #1 probability: {winCount * 100 / N}");
Console.WriteLine($"experiment #2 probability: {winCount2 * 100 / N}");
