BuildBot is a continuous integration service based on Python. This Docker image
contains a BuildBot master setup.

# Installation

## Data container

Create data container:

```docker run -d -v /app/data --name buildbot-data busybox```

Run the BuildBot master:

```docker run -d --volumes-from buildbot-data -p 8010:8010 -p 9989:9989 --name buildbot boxbox/buildbot-master```

## Host volume mount

Create the data directory:

```mkdir ~/buildbot-data```

Run the BuildBot master:

```docker run -d -v ~/buildbot-data:/app/data -p 8010:8010 -p 9989:9989 --name buildbot boxbox/buildbot-master```

# Database and configuration

Both the state database and configuration files are stored in the directory
*/app/data*, which is available as a Docker volume.

If you are using a data container, you can edit the configuration by using the following Docker command, for example (replace *vi* by your favorite editor):

```docker run --rm -it --volumes-from buildbot-data ubuntu vi /app/data/master.cfg```

A few settings shouldn't be changed to prevent the image from breaking:

  * Port numbers (8010 for the web, 9989 for the slaves)
  * Database path (sqlite:///state.sqlite)
  * Configuration path (/app/data/master.cfg)

# Contact

  * E-Mail: docker@boxbox.org
  * Web: https://github.com/TankOs/docker-buildbot-master
