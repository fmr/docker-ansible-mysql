====================
Dockerfile for MySQL
====================


This repository contains a Dockerfile that installs Ansible_, which builds a
MySQL image.


Base Docker Image
==================

* `dockerfile/ansible`_


Requirements
============

* Docker_
* Fig_ (optional)


Usage
=====


1. Build the image::

    docker build -t <tag> .

2. Run a MySQL container::

    docker run <tag>

Alternatively, set up a  ``fig.yml`` file like the example, and run::

    fig up

.. _Ansible: http://www.ansible.com/
.. _`dockerfile/ansible`: https://dockerfile.github.io/#/ansible
.. _Docker: https://www.docker.com/
.. _Fig: http://www.fig.sh/
