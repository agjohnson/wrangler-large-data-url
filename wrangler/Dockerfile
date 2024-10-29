FROM node:18-slim
RUN apt update && apt install net-tools
RUN npm install -g wrangler@3.82.0
RUN mkdir /usr/local/app/
COPY ./index.js /usr/local/app/
COPY ./wrangler.toml /usr/local/app/
WORKDIR /usr/local/app/
ENTRYPOINT ["wrangler", "dev", "--ip", "0.0.0.0"]
