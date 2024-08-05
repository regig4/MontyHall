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
                          .Select(x => new PrizeChoice(rand.Next(0, 3), rand.Next(0, 3)))
                          .Select(x => new PrizeChoice
                          (
                              x.Prize,
                              x.Prize == x.Choice 
                                         ? rand.GetItems([0, 1, 2], 1)[0] 
                                         : rand.GetItems([x.Choice, x.Prize], 1)[0]
                          ))
                          .Where(x => x.Choice == x.Prize)
                          .Count();


Console.WriteLine($"experiment #1 probability: {winCount * 100 / N}");
Console.WriteLine($"experiment #2 probability: {winCount2 * 100 / N}");

record PrizeChoice(int Prize, int Choice);