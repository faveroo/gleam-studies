# Gleam Studies — Code Conventions

This document defines the conventions for exercises, examples, and tests in the **Gleam Studies** repository. It is a living guide: we can refine it as we learn more about idiomatic Gleam.

## 1. Language

- Write **code, identifiers, file and directory names, comments, and documentation in English**.
- Prefer clear, descriptive English names over abbreviations.
- Our learning discussions and code reviews may remain in Portuguese.

## 2. Naming

| Element | Convention | Example |
| --- | --- | --- |
| Modules and files | `snake_case` | `number_classification.gleam` |
| Functions | `snake_case` | `classify_number` |
| Variables and parameters | `snake_case` | `total_count` |
| Constants | `snake_case` | `max_attempts` |
| Custom types | `PascalCase` | `Classification` |
| Type constructors | `PascalCase` | `Positive`, `Negative`, `Zero` |
| Test functions | Descriptive `snake_case` ending in `_test` | `negative_number_test` |

Use argument labels only when they improve the call site. For straightforward functions, prefer `fn classify(number: Int)` over a redundant external label.

## 3. Project structure

Organize learning exercises by topic, with corresponding test modules:

```text
src/
  exercises/
    classification.gleam
    lists.gleam
    results.gleam

test/
  exercises/
    classification_test.gleam
    lists_test.gleam
    results_test.gleam
```

- Keep each module focused on a clear topic or responsibility.
- Prefer matching names between source files and their tests.
- Use English directory names such as `exercises/` (rather than `exercicios/`) in new work.
- Avoid adding unnecessary layers of abstraction to small exercises.

## 4. Idiomatic Gleam

- Prefer **small, focused, pure functions** when practical.
- Make public function signatures clear, including meaningful parameter and return types.
- Use `case` and pattern matching when they express the logic more clearly than nested conditions.
- Use guards for simple additional conditions on matched values.
- Handle all meaningful cases explicitly; avoid a wildcard (`_`) when it could hide a missing variant.
- Prefer standard-library functions for routine collection operations, except when an exercise explicitly asks for recursion or another technique.
- Use the pipeline operator (`|>`) when it makes a sequence of transformations easier to read.
- Represent domain states with custom types instead of arbitrary strings or numbers when appropriate.
- Prefer `Result` for operations that can fail and `Option` when a value may be absent.
- Remove `todo` placeholders from completed exercises.

## 5. Example

**`src/exercises/classification.gleam`**

```gleam
pub type Classification {
  Positive
  Negative
  Zero
}

pub fn classify(number: Int) -> Classification {
  case number {
    value if value > 0 -> Positive
    value if value < 0 -> Negative
    _ -> Zero
  }
}
```

**`test/exercises/classification_test.gleam`**

```gleam
import exercises/classification

pub fn positive_number_test() {
  assert classification.classify(10) == classification.Positive
}

pub fn negative_number_test() {
  assert classification.classify(-5) == classification.Negative
}

pub fn zero_test() {
  assert classification.classify(0) == classification.Zero
}
```

---

**Guiding principle:** Favor clarity and idiomatic Gleam over cleverness. If an exercise intentionally explores a less idiomatic technique (for example, manual recursion), document that learning goal rather than forcing a production-style solution.
