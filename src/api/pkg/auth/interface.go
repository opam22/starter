package auth

import "time"

type Reader interface {
	Login(login LoginCredential) (string, time.Time, error)
}

type Repository interface {
	Reader
}

type UseCase interface {
	Reader
}
