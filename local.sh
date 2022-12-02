export NODE_VERSION=$(curl -sSL https://nodejs.org/dist/latest-v16.x/ | grep linux-x64.tar.gz | sed -n "s/.*>node-v\(.*\)-linux.*<.*/\1/p")
echo "Using node version ${NODE_VERSION}"

docker build -t moo --build-arg OS_NAME=alpine --build-arg OS_VERSION=3.17 --build-arg NODE_VERSION=${NODE_VERSION} -f Dockerfile .
docker build -t moo --build-arg OS_NAME=debian --build-arg OS_VERSION=bookworm --build-arg NODE_VERSION=${NODE_VERSION} -f Dockerfile .
docker build -t moo --build-arg OS_NAME=amazonlinux --build-arg OS_VERSION=2 --build-arg NODE_VERSION=${NODE_VERSION} -f Dockerfile .

export NODE_VERSION=$(curl -sSL https://nodejs.org/dist/latest-v18.x/ | grep linux-x64.tar.gz | sed -n "s/.*>node-v\(.*\)-linux.*<.*/\1/p")
echo "Using node version ${NODE_VERSION}"

docker build -t moo --build-arg OS_NAME=alpine --build-arg OS_VERSION=3.17 --build-arg NODE_VERSION=${NODE_VERSION} -f Dockerfile .
docker build -t moo --build-arg OS_NAME=debian --build-arg OS_VERSION=bookworm --build-arg NODE_VERSION=${NODE_VERSION} -f Dockerfile .
