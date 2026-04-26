# bedtools

Source-built container for `bedtools`, a toolkit for genome arithmetic on BED/GFF/VCF/BAM interval data.

## Quick Usage

```bash
docker pull docker.io/picotainers/bedtools:latest
docker run --rm docker.io/picotainers/bedtools:latest --help
```

## Usage

```bash
# show version
docker run --rm docker.io/picotainers/bedtools:latest --version

# intersect two BED files mounted from the current directory
docker run --rm -v "$(pwd):/data" docker.io/picotainers/bedtools:latest \
  intersect -a /data/a.bed -b /data/b.bed
```

## Building

```bash
docker build -t docker.io/picotainers/bedtools:latest .
```
