install:
	yarn install

# lint:
# 	npm init @eslint/config -y && yarn lint

test:
	yarn test

migrate:
	yarn run db:migrate:test

build:
	yarn build

run:
	yarn start
