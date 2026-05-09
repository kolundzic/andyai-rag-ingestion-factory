# macOS Bash Compatibility Rule

Future TAP-TAP / MASTER-UDARAC scripts must avoid Bash 4-only syntax unless they explicitly run through a known modern Bash interpreter.

Avoid ${var,,}, associative arrays, and Bash 4-only parameter expansion.
