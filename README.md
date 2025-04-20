# Leonard Excoffier | Personal Portfolio

This is my personal portfolio website built with the [Leptos](https://github.com/leptos-rs/leptos) web framework - a Rust-based reactive web framework.

## Technology Stack

- **Framework**: [Leptos](https://leptos.dev/) - modern Rust-based web framework
- **Language**: Rust with WebAssembly for client-side
- **Styling**: SCSS
- **Testing**: Playwright for end-to-end testing
- **Deployment**: Docker containerization

## Development

### Prerequisites

Before running this project, ensure you have the following installed:

1. [Rust](https://www.rust-lang.org/tools/install) (latest stable version)
2. WebAssembly target: `rustup target add wasm32-unknown-unknown`
3. Cargo Leptos: `cargo install cargo-leptos --locked`
4. [Node.js](https://nodejs.org/) (for SCSS compilation and end-to-end tests)
5. Sass: `npm install -g sass`

### Running Locally

To start the development server with hot reloading:

```bash
cargo leptos watch
```

The site will be available at `http://localhost:3000`

### Building for Production

```bash
cargo leptos build --release
```

The compiled output will be in:

- Server binary: `target/server/release/excoffierleonard_com`
- Site assets: `target/site/`

### Running Tests

For unit and integration tests:

```bash
cargo test
```

For end-to-end tests (requires the server to be running):

```bash
cargo leptos end-to-end
```

## Deployment

### Using Docker

A Dockerfile and docker-compose.yml are included for easy containerization:

```bash
docker compose up -d
```

### Manual Deployment

After building for production, copy the server binary and site directory to your server and set the required environment variables:

```bash
export LEPTOS_OUTPUT_NAME="excoffierleonard_com"
export LEPTOS_SITE_ROOT="site"
export LEPTOS_SITE_PKG_DIR="pkg"
export LEPTOS_SITE_ADDR="0.0.0.0:3000"
```

Then run the server binary.

## Project Structure

- `/src` - Rust source code
  - `app.rs` - Main application component
  - `lib.rs` - WASM hydration
  - `main.rs` - Server setup
- `/style` - SCSS stylesheets
- `/assets` - Static assets
- `/end2end` - End-to-end tests with Playwright

## License

All rights reserved. This code is not licensed for public use or distribution.
