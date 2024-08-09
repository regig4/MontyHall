package main

import (
	"fmt"
	"math/rand"
)

func experiment(n int) int {
	win_count := 0

	for range n {
		prize := rand.Intn(3)
		choice := rand.Intn(3)
		if prize == choice {
			win_count++
		}
	}

	return win_count
}

func experiment2(n int) int {
	win_count := 0

	for range n {
		prize := rand.Intn(3)
		choice := rand.Intn(3)

		possible := make([]int, 0, 3)
		if prize == choice {
			possible = append(possible, 0, 1, 2)
		} else {
			possible = append(possible, 0, choice, prize)
		}

		choice = possible[rand.Intn(len(possible))]

		if prize == choice {
			win_count++
		}
	}

	return win_count
}

func main() {
	const N = 1_000_000
	win_count := experiment(N)
	fmt.Printf("experiment #1 probability: %d\n", win_count*100/N)

	win_count2 := experiment2(N)
	fmt.Printf("experiment #2 probability: %d", win_count2*100/N)
}
