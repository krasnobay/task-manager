FROM ruby:2.5

RUN mkdir -p /task_manager
WORKDIR /task_manager

RUN apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 3

COPY . /task_manager

EXPOSE 3000
CMD bundle exec rails s -b '0.0.0.0' -p 3000
