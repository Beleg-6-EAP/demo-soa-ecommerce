# Dockerfile
FROM ruby:3.2.5
RUN apt-get update -qq && apt-get install -y nodejs

# Set working directory
WORKDIR /demo-soa-ecommerce

# Install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the app
COPY . .

# Expose the port Rails runs on
EXPOSE 8080

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
