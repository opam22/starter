package main

import (
	"database/sql"
	"sync"

	"github.com/opam22/starter/driver"
	"github.com/opam22/starter/pkg/auth"
	"github.com/opam22/starter/pkg/todo"
)

type DepedencyInjector interface {
	InjectTodo(sqlConn *sql.DB) todo.TodoController
	InjectAuth(sqlConn *sql.DB) auth.AuthController
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

func (d *depedency) InjectAuth(sqlConn *sql.DB) auth.AuthController {

	DBHandler := &driver.MySQLHandler{}
	DBHandler.Conn = sqlConn

	JWTHandler := &driver.Claim{}

	authRepository := &auth.AuthRepository{DB: DBHandler, JWT: JWTHandler}
	authService := &auth.AuthService{authRepository}
	authController := auth.AuthController{authService}

	return authController
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
