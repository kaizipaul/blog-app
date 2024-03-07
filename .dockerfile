# Use an official Ruby runtime as a parent image
FROM ruby:3.0.0

# Set environment variables for Rails
ENV RAILS_ENV=production \
    RAILS_SERVE_STATIC_FILES=true \
    RAILS_LOG_TO_STDOUT=true

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install --without development test

# Copy the main application into the container
COPY . .

# Precompile assets (if applicable)
RUN rails assets:precompile

# Expose port 3000 to the outside world
EXPOSE 3000

# Start Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
