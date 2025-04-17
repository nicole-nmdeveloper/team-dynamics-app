FROM ruby:3.3.8

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /team_dynamics_app

COPY Gemfile /team_dynamics_app/Gemfile
COPY Gemfile.lock /team_dynamics_app/Gemfile.lock

RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
