# bedtools
Source-built static `bedtools` container.

## how to use
```bash
docker run --rm -v "$(pwd):/data" picotainers/bedtools:latest --help
```

## example
```bash
docker run --rm -v "$(pwd):/data" picotainers/bedtools:latest \
  intersect -a /data/a.bed -b /data/b.bed
```
