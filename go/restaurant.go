package main

import (
	"log"
	"math/rand"
	"sync"
	"time"
	"sync/atomic"
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

// Implement the rest of the simulation here. You may need to add more imports
// above.
type Order struct {
    id uint64
    customer string
    reply chan *Order
    preparedBy string
}
var nextId uint64 
var Waiter = make(chan *Order, 3)

func NewOrder(customer string) *Order {
    return &Order{
        id: atomic.AddUint64(&nextId, 1),
        customer: customer,
        reply: make(chan *Order),
    }
}

func customer(name string, waitGroup *sync.WaitGroup) {	
	defer waitGroup.Done()
	waitGroup.Add(1)

	for mealsEaten := 0; mealsEaten < 5; {
		order := NewOrder(name)
		log.Println(name, " placed order ", order.id)
		select {
		case Waiter <- order:
			meal := <- order.reply
			do(2, name, "eating cooked order", meal.id, "prepared by", meal.preparedBy)
			mealsEaten++
		case <- time.After(7):
			do(5, name, "waiting too long, abandoing order", order.id)
		}
	}
	log.Println(name, " going home")
}