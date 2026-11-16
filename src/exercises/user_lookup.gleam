import gleam/option.{type Option, None, Some}

pub type User {
  User(id: Int, name: String)
}

pub type DatabaseError {
  ConnectionFailed
}

pub fn find_user(
  id: Int,
  database_available: Bool,
) -> Result(Option(User), DatabaseError) {
  case database_available, id {
    False, _ -> Error(ConnectionFailed)
    True, 1 -> Ok(Some(User(1, "Alice")))
    True, _ -> Ok(None)
  }
}
