FROM klakegg/hugo:latest

COPY . /src

WORKDIR /src

EXPOSE 1313

CMD ["hugo", "server", "--bind", "0.0.0.0"]
