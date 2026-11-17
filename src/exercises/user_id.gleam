import gleam/int
import gleam/result

pub type UserIdError {
  InvalidInteger
  NonPositiveId
}

fn parse_id(input: String) -> Result(Int, UserIdError) {
  int.parse(input) |> result.map_error(fn(_) { InvalidInteger })
}

fn ensure_positive_id(id: Int) -> Result(Int, UserIdError) {
  case id > 0 {
    True -> Ok(id)
    _ -> Error(NonPositiveId)
  }
}

pub fn validate_user_id(input: String) -> Result(Int, UserIdError) {
  input
  |> parse_id
  |> result.try(ensure_positive_id)
}

pub fn validate_user_id_with_use(input: String) -> Result(Int, UserIdError) {
  use id <- result.try(parse_id(input))
  ensure_positive_id(id)
}
