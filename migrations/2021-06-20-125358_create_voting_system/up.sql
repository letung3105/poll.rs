CREATE TABLE users (
	id INTEGER NOT NULL PRIMARY KEY,
	username TEXT NOT NULL UNIQUE
);
CREATE UNIQUE INDEX uname ON users(username);

CREATE TABLE options (
	id INTEGER NOT NULL PRIMARY KEY,
	title TEXT NOT NULL,
	content TEXT NOT NULL,
	done BOOLEAN NOT NULL DEFAULT 'f'
);

CREATE TABLE votes (
	id INTEGER NOT NULL PRIMARY KEY,
	user_id INTEGER NOT NULL,
	option_id INTEGER NOT NULL,
	ord INTEGER NOT NULL,

	FOREIGN KEY (user_id) REFERENCES users(id)
	FOREIGN KEY (option_id) REFERENCES options(id)
);
CREATE INDEX poll ON votes(user_id ASC, ord ASC);
CREATE UNIQUE INDEX uniq_vote ON votes(user_id, option_id);