## 1.0.0-rc1 (2026-01-07)

### BREAKING CHANGE

- Mount paths for volumes have changed.

### feat

- **docker**: use official isc/bind as base image
- **docker**: Add ALL volumes that bind will use
- **docker**: Cleanup installed zones
- **zone**: Add zone root hints
- **zone**: Add zone localhost
- **zone**: Add reverse zone 127
- **view**: Add External view
- **view**: Add Internal view
- Hide Server Version
- **docker**: Update bind 9.18.24 -> 9.20.17
- **docker**: Update alpine base image
- **docker**: Add bind vol

### Refactoring

- Update conf load

## 0.1.0 (2024-03-19)

### feat

- **bind**: update 9.18.19-r0 -> 9.18.24-r0
- **bind**: run command to specify ipv4, config file and log file
- **bind**: update 9.18.19-r0 -> 9.18.24-r0

## 0.1.0rc0 (2023-11-13)

### feat

- create bind9 dns server in docker container
- Logging configured for bind
- dynamic config loading
- **container**: initial dockerfile and settings
- **ci**: add repo gitlab-ci for ci jobs

### Fixes

- **supervisor**: named was not set to start correctly
- **supervisor**: named was not set to start correctly
- **health_check**: use the default socket name for supervisord
- ensure correct permissions for bind config files
- **ci**: remove setting of arg as this is done via cli

## 0.0.1 (2023-11-12)
