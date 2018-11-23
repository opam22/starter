package todo

type TodoService struct {
	Repo Repository
}

func (s *TodoService) Find(id int) (Todo, error) {
	// logic here
	return s.Repo.Find(id)
}

func (s *TodoService) FindAll() ([]Todo, error) {
	// logic here
	return s.Repo.FindAll()
}

func (s *TodoService) Store(todo Todo) (int64, error) {
	// logic here
	return s.Repo.Store(todo)
}
