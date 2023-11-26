require 'sqlite3'
require 'dotenv/load'

db_name = ENV['DB_NAME'] || 'production'

DB = SQLite3::Database.new("db/#{db_name}.db")

DB.execute <<-SQL
  CREATE TABLE IF NOT EXISTS emulators (
    id INTEGER PRIMARY KEY,
    name TEXT,
    version TEXT,
    release_date DATE,
    download_link TEXT
    );
  SQL

DB.execute <<-SQL
  CREATE TABLE IF NOT EXISTS systems (
    id INTEGER PRIMARY KEY,
    name TEXT
  );
SQL

DB.execute <<-SQL
  CREATE TABLE IF NOT EXISTS games (
    id INTEGER PRIMARY KEY,
    name TEXT,
    release_date DATE,
    system_id Integer,
    FOREIGN KEY (system_id) REFERENCES systems(id)
  );
SQL

DB.execute <<-SQL
  CREATE TABLE IF NOT EXISTS emulators_systems (
    emulator_id INTEGER,
    system_id INTEGER,
    PRIMARY KEY (emulator_id, system_id),
    FOREIGN KEY (emulator_id) REFERENCES emulators(id),
    FOREIGN KEY (system_id) REFERENCES systems(id)
  );
SQL

DB.execute <<-SQL
  CREATE TABLE IF NOT EXISTS games_emulators (
    game_id INTEGER,
    emulator_id INTEGER,
    PRIMARY KEY (game_id, emulator_id),
    FOREIGN KEY (game_id) REFERENCES games(id),
    FOREIGN KEY (emulator_id) REFERENCES emulators(id)
  );
SQL

# DB.execute("INSERT INTO systems (name) VALUES ('PlayStation')");
# DB.execute("INSERT INTO systems (name) VALUES ('Nintendo Switch')");

# DB.execute("INSERT INTO emulators (name, version, release_date) VALUES ('PCSX2', '1.6.0', '2020-05-07')");
# DB.execute("INSERT INTO emulators (name, version, release_date) VALUES ('Yuzu', 'Early Access 550', '2021-04-10')");

# DB.execute("INSERT INTO games (name, release_date, system_id) VALUES ('Final Fantasy X', '2001-07-19', 1)");
# DB.execute("INSERT INTO games (name, release_date, system_id) VALUES ('The Legend of Zelda: Breath of the Wild', '2017-03-03', 2)");

# # Assuming PCSX2 (id 1) supports PlayStation (id 1)
# DB.execute("INSERT INTO emulators_systems (emulator_id, system_id) VALUES (1, 1)");

# # Assuming Yuzu (id 2) supports Nintendo Switch (id 2)
# DB.execute("INSERT INTO emulators_systems (emulator_id, system_id) VALUES (2, 2)");

# # Assuming Final Fantasy X (id 1) can be played on PCSX2 (id 1)
# DB.execute("INSERT INTO games_emulators (game_id, emulator_id) VALUES (1, 1)");

# # Assuming The Legend of Zelda: BotW (id 2) can be played on Yuzu (id 2)
# DB.execute("INSERT INTO games_emulators (game_id, emulator_id) VALUES (2, 2)");

