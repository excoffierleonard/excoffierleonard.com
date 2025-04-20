##############################
# Stage 1: Prepare the Recipe
##############################
FROM rust:slim AS chef
RUN apt update && apt install -y perl make g++
RUN cargo install cargo-chef
WORKDIR /app
# Copy only the files needed to generate the recipe (e.g., Cargo.toml, Cargo.lock, and source files)
COPY . .
# Create the recipe file that captures your dependency graph.
RUN cargo chef prepare --recipe-path recipe.json

##############################
# Stage 2: Cache Dependencies
##############################
FROM rust:slim AS builder
RUN apt update && apt install -y perl make g++
RUN rustup target add wasm32-unknown-unknown
RUN cargo install cargo-chef cargo-leptos 
WORKDIR /app
# Copy the pre-generated recipe
COPY --from=chef /app/recipe.json recipe.json
# Build (or “cook”) the dependencies from the recipe. This layer is cached until your dependencies change.
RUN cargo chef cook --release --recipe-path recipe.json
# Now copy the full source and compile the application.
COPY . .
RUN cargo leptos build --release

##############################
# Stage 3: Final Image
##############################
FROM debian:stable-slim AS runtime
ENV RUST_LOG="info"
ENV LEPTOS_SITE_ADDR="0.0.0.0:8080"
ENV LEPTOS_SITE_ROOT="site"
WORKDIR /app
COPY --from=builder /app/target/release/excoffierleonard_com .
COPY --from=builder /app/target/site ./site
EXPOSE 8080
CMD ["./excoffierleonard_com"]