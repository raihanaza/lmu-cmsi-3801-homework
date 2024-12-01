package main

import (
	"log"
	"math/rand"
	"sync"
	"sync/atomic"
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


// its not bools, its actully Orders
// not actually correct -- look at the Java
type Order struct {
    id uint64
    customer string
    // make a reply which is a channel that can take the order (HINT you need a pointer to the order)
    // also the name of the cook 
}
// you also need a mechanism to generate the next order id - similar to java, you need atomic -- import atomic
var nextId atomic.Uint64 

// a waiter can only hold 3 orders at once
var Waiter = make(chan *Order, 3)

func Cook(name string) {
    do(10, name, "is cooking")
    // log that the cook is starting
    // loop forever
    //      wait for an order from the waiter
    //      cook it 
    //      put the name of the cook in the order 
    //      send it back into the reply channel: order.reply <- order
}

func Customer(name string, wg *sync.WaitGroup) {
    do(10, name, "is eating")
    for mealsEaten := 0; mealsEaten < 5; {
        // place an order 
        // select statement so that if the waiter gets it within 7 seconds
            // then you get it from the cook, and eat it (mealsEaten++)
            // otherwise, if you don't get it, leave the restaurant 
            // do(5, name, "is waiting too long, abandoning the order", order.id)
    }
}

func main() {
    customers := [10]string{
        "Ani", "Bai", "Cat", "Dao", "Eve", "Fay", "Gus", "Hua", "Iza", "Jai",
    }
    // in a loop, start each customer as a goroutine
    var wg sync.WaitGroup
    for _, customer := range customers {
        wg.Add(1)
        go Customer(customer, &wg)
    }
    // start 3 cooks, Remy, Linguini, and Collette 
    go Cook("Remy")
    go Cook("Linguini")
    go Cook("Collette")
    // wait for all customers to finish 
    log.Println("Restaurant closing")
}