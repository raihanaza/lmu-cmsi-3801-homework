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
	randomMillis := 500*seconds + rand.Intn(500*seconds)
	time.Sleep(time.Duration(randomMillis) * time.Millisecond)
}

type Order struct {
	id         uint64
	customer   string
	reply      chan Order
	preparedBy string
}

var nextId uint64

func cook(name string, waiter chan Order) {
	log.Println(name, "starting work")
	for order := range waiter {
		do(10, name, "cooking order", order.id, "for", order.customer)
		order.preparedBy = name
		order.reply <- order
	}
}

func customer(name string, waiter chan Order, wg *sync.WaitGroup) {
	defer wg.Done()

	mealsEaten := 0
	for mealsEaten < 5 {
		order := Order{
			id:       atomic.AddUint64(&nextId, 1),
			customer: name,
			reply:    make(chan Order, 1),
		}
		log.Println(name, "placed order", order.id)

		select {
		case waiter <- order:
			meal := <-order.reply
			do(2, name, "eating cooked order", meal.id, "prepared by", meal.preparedBy)
			mealsEaten++
		case <- time.After(7 * time.Second):
			do(5, name, "waiting too long, abandoing order", order.id)
		}
	}
	log.Println(name, "going home")
}

func main() {
	waiter := make(chan Order, 3)
	var wg sync.WaitGroup

	go cook("Remy", waiter)
	go cook("Colette", waiter)
	go cook("Linguini", waiter)

	customers := []string{"Ani", "Bai", "Cat", "Dao", "Eve", "Fay", "Gus", "Hua", "Iza", "Jai"}

	for _, customerName := range customers {
		wg.Add(1)
		go customer(customerName, waiter, &wg)
	}

	wg.Wait()
	close(waiter)
	log.Println("Restaurant closing")
}