TARGETS = build push up down

.PHONY: ${TARGETS} \
		clean

${TARGETS}: docker.env
	-@docker compose --env-file docker.env $@

clean:
	@sudo rm -rf data