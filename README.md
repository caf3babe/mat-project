To create a pdf of the Asciidoc file execute following command

```bash
docker run -it --rm -v $(pwd):/documents/ docker.io/asciidoctor/docker-asciidoctor asciidoctor-pdf /documents/Report.adoc
```
