package main

import (
	"database/sql"
	"sync"
	"time"

	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
	"github.com/go-chi/render"
	"github.com/opam22/form/config"
)

type Router interface {
	Init() *chi.Mux
}

type router struct{}

func (router *router) Init() *chi.Mux {

	sqlConn, err := sql.Open("mysql", config.MYSQL_HOST)

	if err != nil {
		panic(err)
	}

	todo := Depedency().InjectTodo(sqlConn)
	auth := Depedency().InjectAuth(sqlConn)

	r := chi.NewRouter()

	r.Use(middleware.RequestID)
	r.Use(middleware.Logger)
	r.Use(middleware.Recoverer)
	r.Use(middleware.URLFormat)
	r.Use(render.SetContentType(render.ContentTypeJSON))
	r.Use(middleware.Timeout(60 * time.Second))

	// route
	r.Get("/todo/{id}", mustLogin(todo.Find))
	r.Get("/todos", todo.FindAll)
	r.Post("/store", todo.Store)

	r.Post("/auth/login", auth.Login)
	r.Get("/auth/logout", auth.Logout)

	return r
}

func Route() Router {

	var (
		r    *router
		once sync.Once
	)

	if r == nil {
		once.Do(func() {
			r = &router{}
		})
	}
	return r
}
