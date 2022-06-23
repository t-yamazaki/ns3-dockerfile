# [NS-3](https://www.nsnam.org/) Dockerfile

Dockerfile for building and testing a [NS-3](https://www.nsnam.org/).

This Dockerfile installes minimal packages.
Change the `apt-get install ...` to match the NS-3 extensions you want to use.

reference: https://www.nsnam.org/wiki/Installation#Ubuntu.2FDebian.2FMint

## Requirements
- Storage: 10GB

## Commands
```bash
# Build the docker image (This process takes 15+ mins.)
docker build . --build-arg NS3=3.36.1 --tag ns3:3.36.1

# Run a container
docker run -it --name ns3 ns3:3.36.1
## or
docker start -ai ns3

# Testing(in a container)
cd /usr/ns3
./ns3 run hello-simulator
## or
./test.py

# examples
docker run -it --rm -v /path/to/workspace:/usr/workspace ns3:3.36.1
./ns3 run /usr/workspace/my_simulation.py --cwd=/usr/workspace
```
