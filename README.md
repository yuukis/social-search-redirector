# Social Search Redirector

A simple web application that redirects users to social media search results based on predefined keywords.  
This service is useful for quickly checking posts from technical events in Yamanashi.

## Features

- Supports multiple social platforms:
  - `x` (formerly Twitter)
- Keywords are stored in a YAML file, allowing comments and easy updates.
- OR-search for multiple keywords.
- Lightweight and serverless-friendly: runs on Docker with WeBrick.

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/yuukis/social-search-redirector.git
cd social-search-redirector
```

### 2. Install Dependencies

Ensure you have **Ruby 3.0+** installed.

```bash
gem install bundler
bundle install
```

### 3. Configure Your Keywords

Edit `search_words.yml`:

```yaml
x:
  - "Kofu.rb"
  - "Shingen.py"
```

Each key represents a service, and each array contains multiple search keywords.
The app will join them using `OR`.

### 4. Start the App

Run the app with Sinatra:

```bash
ruby app.rb
```

The app will be available at:\
➡️ http://localhost:4567/x

### 🐳 Optional: Run with Docker

If you prefer running with Docker, you can still use the included `Dockerfile` and `docker-compose.yml`.

```bash
docker-compose up --build
```

## License

Distributed under the Apache License, Version 2.0. See `LICENSE` for more information.

## Contact

Yuuki Shimizu - [@yuuki_maxio](https://x.com/yuuki_maxio) 