# MetaTube deployment with AVBASE enabled

Builds Apache-2.0 upstream [MetaTube SDK](https://github.com/metatube-community/metatube-sdk-go) at commit `59ac7f294e9c5b7fac400c5adbc3777a36cff5a4`.

The only source change registers the existing `provider/avbase` package in `engine/register.go`.
Configure `TOKEN` as a hosting secret. This repository contains no credentials, user files or metadata.
The server performs provider requests remotely; clients should call only its HTTPS endpoint.
