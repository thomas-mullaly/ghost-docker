# Ghost Image Setup for my Blog

This is the customized Ghost Docker image I use for my blog. It is based off of the
official Ghost Docker image with a few modifications.

1. I pull in a customized version of the Casper theme, which is what I use for my blog.
2. I override the default entrypoint script to make it easier to push theme/config
changes.

I've got an automated Docker hub build set up for this image that you can find here: https://hub.docker.com/r/tmullaly/ghost-docker/
