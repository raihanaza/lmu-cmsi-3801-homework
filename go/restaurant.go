package main

import (
	"log"
	"math/rand"
	"sync"
	"sync/atomic"
	"time"
)

func do(seconds int, action ...any) {
    log.Println(action...)
    randomMillis := 500 * seconds + rand.Intn(500 * seconds)
    time.Sleep(time.Duration(randomMillis) * time.Millisecond)
}

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

func Cook(name string) {
    log.Println(name, "starting work")
    for {
        order := <-Waiter
        do(10, name, "cooking order", order.id, "for", order.customer)
        order.preparedBy = name
        order.reply <- order
    }
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