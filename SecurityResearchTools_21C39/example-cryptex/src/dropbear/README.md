# dropbear SSH

[Dropbear](https://matt.ucc.asn.au/dropbear/dropbear.html) is a tiny SSH server with few external dependencies.

We apply a simple diff to dropbear to make it cryptex aware:

- Update the `PATH` environment variable to include the current cryptex
- Read the `CRYPTEX_SHELL` environment variable to change the shell to one
  relative to the current cryptex.
- Add some logging to help debugging failures

# Troubleshooting

- Connect with: `ssh -vvv` and check for a banner.
- Open `Console.app` and search for "dropbear" or "cryptex"

COMMENT
----
THURSDAY 5 MAY 2022

ADDED a working binary for dropbear due to foobar
