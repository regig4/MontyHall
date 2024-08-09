var N = 1000000;
var winCount = Array.from(Array(N).keys())
    .map(function (_) { return ({
    choice: Math.floor(Math.random() * 3),
    prize: Math.floor(Math.random() * 3)
}); })
    .filter(function (x) { return x.choice == x.prize; })
    .length;
var winCount2 = Array.from(Array(N).keys())
    .map(function (_) { return ({
    choice: Math.floor(Math.random() * 3),
    prize: Math.floor(Math.random() * 3)
}); })
    .map(function (x) { return ({
    prize: x.prize,
    choice: (x.prize == x.choice
        ? [0, 1, 2][Math.floor(Math.random() * 3)]
        : [x.choice, x.prize][Math.floor(Math.random() * 2)])
}); })
    .filter(function (x) { return x.choice == x.prize; })
    .length;
console.log("experiment #1 probability: ".concat(winCount * 100 / N));
console.log("experiment #2 probability: ".concat(winCount2 * 100 / N));
