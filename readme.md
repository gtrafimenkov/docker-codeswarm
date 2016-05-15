# code_swarm in a Docker container

This is [code_swarm](http://vis.cs.ucdavis.edu/~ogawa/codeswarm/) (a software visualization tool) installed in a Docker container.

It can be used to visualize the change history of a software project.
The wrapper script (extra-scripts/visualize-repo.sh) supports only Git
repositories at the moment, but code_swarm itself also supports
Subversion and probably other source control systems.

## How to visualize Git project change history

Change your current directory to the software project you want to visualize and run:

```
docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/repo --env=DISPLAY gtrafimenkov/codeswarm
```

## Links

[http://vis.cs.ucdavis.edu/~ogawa/codeswarm](http://vis.cs.ucdavis.edu/~ogawa/codeswarm) - An experiment in organic software visualization

[https://code.google.com/archive/p/codeswarm](https://code.google.com/archive/p/codeswarm) - source codes

## Similar projects

[http://gource.io](http://gource.io) is similar but shows change
history differently - software projects are displayed by Gource as an
animated tree with the root directory of the project at its
centre. Directories appear as branches with files as
leaves. Developers can be seen working on the tree at the times they
contributed to the project.

Also check out Docker container [gtrafimenkov/gource](https://hub.docker.com/r/gtrafimenkov/gource) with Gource installed.
