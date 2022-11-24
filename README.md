# Node Docker Images

This project produces a docker image with minimal layers containing the latest
Node LTS release along with pnpm, esbuild and typescript for linux/amd64 and 
linux/arm64.

# How do I use this docker image?

For glibc based linux distributions
```Dockerfile
COPY --from=truemark/node:latest /usr/local/ /usr/local/
```

For musl based linux distributions
```Dockerfile
COPY --from=truemark/node:alpine /usr/local/ /usr/local/
```

## Maintainers

 - [erikrj](https://github.com/erikrj)

## License

The contents of this repository are released under the BSD 3-Clause license. See the
license [here](https://github.com/truemark/node-docker/blob/main/LICENSE.txt).
