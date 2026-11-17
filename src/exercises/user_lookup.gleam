import gleam/result
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

pub fn find_user_name(
  id: Int,
  database_available: Bool,
) -> Result(Option(String), DatabaseError) {
  find_user(id, database_available)
  |> result.map(fn(maybe_user) {
    option.map(maybe_user, fn(user) { user.name })
  })
}

pub fn describe_user_lookup(
  result: Result(Option(User), DatabaseError)
) -> String {
  case result {
    Error(ConnectionFailed) -> "Database unavailable"
    Ok(None) -> "User not found"
    Ok(Some(User(name:, ..))) -> "User found: " <> name
  }
}
