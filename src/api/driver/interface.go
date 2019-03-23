package driver

import "database/sql"

type DBHandler interface {
	Execute(statement string) (sql.Result, error)
	Query(statement string) (Row, error)
	QueryRow(statement string) *sql.Row
}

type Row interface {
	Scan(dest ...interface{}) error
	Next() bool
}
