package auth

import (
	"fmt"

	"github.com/opam22/form/driver"
)

type AuthRepository struct {
	driver.DBHandler
}

func (r *AuthRepository) Login(loginCredential LoginCredential) (int64, error) {

	var count int

	err := r.QueryRow(fmt.Sprintf("SELECT count(*) FROM users WHERE email = '%s' AND password = '%x' LIMIT 1", loginCredential.Email, loginCredential.Password)).Scan(&count)
	switch {
	case err != nil:
		return 0, err
	default:
		// TODO
		// USE JWT
		fmt.Printf("\nNumber of rows are %d\n", count)
	}

	if err != nil {
		return 0, err
	}

	return 1, nil
}
