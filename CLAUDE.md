# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

- Build: `cargo leptos build`
- Watch and serve: `cargo leptos watch`
- Release build: `cargo leptos build --release`
- Run tests: `cargo test`
- Run end-to-end tests: `cargo leptos end-to-end`
- Run single test: `cargo test test_name`

## Formatting & Linting

- Format code: `cargo fmt`
- Check formatting: `cargo fmt --check`
- Run lints: `cargo clippy`

## Code Style Guidelines

- Use Rust 2021 edition
- Follow standard Rust naming conventions (snake_case for functions/variables, PascalCase for types)
- Organize imports alphabetically with std first, then external crates, then local modules
- Use #[component] for Leptos components with descriptive docstrings
- Always provide type annotations for public functions and method signatures
- Use proper error handling with Result types
- Keep view! macros well-formatted with proper indentation
- Follow the Leptos component pattern with functions returning impl IntoView
