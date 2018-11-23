package main

import (
	"database/sql"
	"sync"

	"github.com/opam22/clean/config"
	"github.com/opam22/clean/driver"
	"github.com/opam22/clean/todo"
)

type DepedencyInjector interface {
	InjectTodo() todo.TodoController
}

type depedency struct{}

func (d *depedency) InjectTodo() todo.TodoController {

	sqlConn, _ := sql.Open("mysql", config.MYSQL_HOST)
	DBHandler := &driver.MySQLHandler{}
	DBHandler.Conn = sqlConn

	todoRepository := &todo.TodoRepository{DBHandler}
	todoService := &todo.TodoService{todoRepository}
	todoController := todo.TodoController{todoService}

	return todoController
}

func Depedency() DepedencyInjector {

	var (
		d    *depedency
		once sync.Once
	)

	if d == nil {
		once.Do(func() {
			d = &depedency{}
		})
	}
	return d
}
