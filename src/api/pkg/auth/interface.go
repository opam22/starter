package auth

type Writer interface {
	Login(login LoginCredential) (int64, error)
}

type Repository interface {
	Writer
}

type UseCase interface {
	Writer
}
