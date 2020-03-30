.PHONY: push
push:
	okteto build -t okteto/hello-world:java-gradle-dev --target dev .
	okteto build -t okteto/hello-world:java-gradle .
