package main

import (
	"log"
	"math/rand"
	"time"
)

// A little utility that simulates performing a task for a random duration.
// For example, calling do(10, "Remy", "is cooking") will compute a random
// number of milliseconds between 5000 and 10000, log "Remy is cooking",
// and sleep the current goroutine for that much time.

func do(seconds int, action ...any) {
    log.Println(action...)
    randomMillis := 500 * seconds + rand.Intn(500 * seconds)
    time.Sleep(time.Duration(randomMillis) * time.Millisecond)
}

func cook(name string, waiter <-chan *Order) {
	fmt.Printf("[%s] starting work\n", name)
	for {
		select {
		case order, ok := <-waiter:
			if !ok {
				fmt.Printf("[%s] channel closed, stopping work\n", name)
				return
			}
			doAction(10, name, "cooking", order.ID, "for", order.Customer)
			order.PreparedBy = name
			order.Reply <- order
		}
	}
}

// Implement the rest of the simulation here. You may need to add more imports
// above.
