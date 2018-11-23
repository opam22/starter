package todo

type Reader interface {
	Find(id int) (Todo, error)
	FindAll() ([]Todo, error)
}

type Writer interface {
	Store(todo Todo) (int64, error)
}

type Repository interface {
	Reader
	Writer
}

type UseCase interface {
	Reader
	Writer
}
