export NODE_VERSION=$(curl -sSL https://nodejs.org/dist/latest-v16.x/ | grep linux-x64.tar.gz | sed -n "s/.*>node-v\(.*\)-linux.*<.*/\1/p")
echo "Using node version ${NODE_VERSION}"

docker buildx build \
  --push \
  --platform linux/arm64,linux/amd64 \
  --builder beta \
  --build-arg NODE_VERSION="${NODE_VERSION}" \
  -f Dockerfile \
  -t truemark/node:beta-${NODE_VERSION} \
  -t truemark/node:beta-16 \
  -t truemark/node:beta \
  .
docker buildx build \
  --push \
  --platform linux/arm64,linux/amd64 \
  --builder beta \
  --build-arg NODE_VERSION="${NODE_VERSION}" \
  -f Dockerfile \
  -t truemark/node:beta-${NODE_VERSION} \
  -t truemark/node:beta-16 \
  -t truemark/node:beta \
  .
