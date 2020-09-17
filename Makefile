consul:
	docker-compose -f docker-compose.yaml up -d
	sleep 10
	CONSUL_HTTP_ADDR=127.0.0.1:8500 consul acl bootstrap

acl:
	consul acl policy create -name terraform -rules 'acl = "write"' || true
	consul acl token create -description "terraform token" -policy-name terraform

clean:
	docker-compose -f docker-compose.yaml down