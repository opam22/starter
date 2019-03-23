package auth

type LoginCredential struct {
	Email    string `json:"email"`
	Password interface{}
}
