FROM ruby:2.5.3


RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qqy && apt-get -qqyy install nodejs yarn

WORKDIR /app

COPY . .

RUN gem install bundler
RUN bundle install

EXPOSE 3000
CMD bundle exec rails s -b '0.0.0.0' -p 3000
