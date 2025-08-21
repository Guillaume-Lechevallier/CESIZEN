# AGENTS Instructions

## Development
- Use `npm install --legacy-peer-deps` when installing frontend dependencies.
- Run `npm test` in `Front/` and `pytest` in `Back/` after changes.
- Do not commit secrets or `.env` files.
- Update `Back/requirements.txt` when Python dependencies change.

## Docker
- Docker may require privileged access; the daemon could fail to start in restricted environments.
- Backend and database use the private network; reverse proxy is the only service exposing ports.

