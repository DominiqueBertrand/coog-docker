# TODO

- Clean up the timesheet proxy's existing HTTPS/file-provider configuration:
  `defaults/traefik/traefik.config.toml` contains the unsupported
  `accessControlAllowOrigin` key, preventing file-provider configuration from
  loading, and `defaults/traefik/acme.json` has mode 664 instead of 600, disabling
  the Let's Encrypt resolver. These appeared during the 2026-11-06 Docker API
  compatibility fix; HTTP routing is restored with Traefik v3.7.17. Localhost
  HTTPS should use the local certificate rather than public ACME issuance.

- Make `/coopengo/GITHUB/coog-portal-gateway.dockerfile` install dependencies
  from the repository Yarn lockfile. It currently copies only `package.json`,
  so container dependencies can drift from the tested local installation.
