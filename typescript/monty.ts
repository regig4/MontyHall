const N: number = 1_000_000;

let winCount: number = Array.from(Array(N).keys())
                    .map(_ => ({
                            choice: Math.floor(Math.random() * 3),
                            prize: Math.floor(Math.random() * 3)
                        }))
                    .filter(x => x.choice == x.prize)
                    .length;

let winCount2: number = Array.from(Array(N).keys())
                    .map(_ => ({
                        choice: Math.floor(Math.random() * 3),
                        prize: Math.floor(Math.random() * 3)
                    }))
                    .map(x => ({ 
                        prize: x.prize,
                        choice: (x.prize == x.choice 
                                   ? [0, 1, 2][Math.floor(Math.random() * 3)] 
                                   : [x.choice, x.prize][Math.floor(Math.random() * 2)])
                    }))
                    .filter(x => x.choice == x.prize)
                    .length;

console.log(`experiment #1 probability: ${winCount * 100 / N}`);
console.log(`experiment #2 probability: ${winCount2 * 100 / N}`);