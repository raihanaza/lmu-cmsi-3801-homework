package main

import (
	"log"
	"math/rand"
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