# bedtools
Source-built static `bedtools` container.

## Quick Usage
```bash
# Pull the image
docker pull docker.io/picotainers/bedtools:latest

# Run the tool
docker run --rm docker.io/picotainers/bedtools:latest --help
```

## Example
```bash
docker run --rm -v "$(pwd):/data" docker.io/picotainers/bedtools:latest \
  intersect -a /data/a.bed -b /data/b.bed
```
