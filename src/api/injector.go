package main

import (
	"database/sql"
	"sync"

	"github.com/opam22/form/driver"
	"github.com/opam22/form/pkg/todo"
)

type DepedencyInjector interface {
	InjectTodo(sqlConn *sql.DB) todo.TodoController
}

type depedency struct{}

func (d *depedency) InjectTodo(sqlConn *sql.DB) todo.TodoController {

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
