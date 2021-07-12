andrewrothstein.opa
=========
![Build Status](https://github.com/andrewrothstein/ansible-opa/actions/workflows/build.yml/badge.svg)


Installs the [Open Policy Agent](https://www.openpolicyagent.org/)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.opa
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
