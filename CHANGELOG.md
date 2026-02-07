# Changelog

## [1.0.1] - 2026-02-07

### Changed
- Renamed gem from `bridge_api` to `bridgeapi_client` (name conflict on RubyGems)

### Added
- `debug` configuration option to toggle verbose HTTP request/response logging (default: `false`)

## [1.0.0] - 2026-02-07

### Changed
- Renamed gem from `bridge_bankin` to `bridge_api`
- Renamed module from `BridgeBankin` to `BridgeApi`
- Full compatibility with Bridge API v3 (2025-01-15)

### Fixed
- Thread safety: API client now uses `Thread.current` storage
- Pagination: fixed order of appended data in `handle_paging`
- Authentication: `generate_token` supports `external_user_id` (v3)

### Removed
- Deprecated v2 methods kept only for backward compatibility warnings
