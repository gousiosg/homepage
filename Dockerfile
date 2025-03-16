FROM ruby:3.0

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    vim

# Set working directory
WORKDIR /site

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install specific Jekyll version and plugins
RUN bundle install

# Copy the rest of the application
COPY . .

# Expose default Jekyll port
EXPOSE 4000

# Command to run when container starts
CMD ["bundle", "exec", "jekyll", "build"]
# CMD ["/bin/bash"]
