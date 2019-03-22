package todo

import (
	"fmt"

	"github.com/opam22/form/driver"
)

type TodoRepository struct {
	driver.DBHandler
}

func (r *TodoRepository) Find(id int) (Todo, error) {
	row, err := r.Query(fmt.Sprintf("SELECT * FROM todos WHERE id = '%d'", id))

	if err != nil {
		return Todo{}, err
	}

	var todo Todo
	row.Next()
	row.Scan(&todo.Id, &todo.Todo)

	return todo, nil
}

func (r *TodoRepository) FindAll() ([]Todo, error) {

	rows, err := r.Query(fmt.Sprintf("SELECT * FROM todos"))

	if err != nil {
		return []Todo{}, err
	}

	var (
		todo  Todo
		todos []Todo
	)
	for rows.Next() {
		rows.Scan(&todo.Id, &todo.Todo)

		todos = append(todos, todo)

	}

	return todos, nil
}

func (r *TodoRepository) Store(todo Todo) (int64, error) {
	res, err := r.Execute(fmt.Sprintf("INSERT INTO todos(name) VALUES ('%s')", todo.Todo))

	if err != nil {
		return 0, err
	}

	id, err := res.LastInsertId()
	if err != nil {
		return 0, err
	}

	return id, nil
}
