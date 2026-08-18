## R CMD check results

0 errors | 0 warnings | 0 notes

## Test environments

* local macOS (aarch64-apple-darwin20), R 4.5.2

## Notes

This is a feature release. Palettes are refreshed to the current season, the WNBA and
five more soccer leagues are added, and the package gains ggplot2 colour and fill scales.
It adds one new dependency, ggplot2, for those scales.

The release is backwards compatible: every team name accepted by 1.0.1 still resolves,
and every palette function takes `legacy = TRUE` to return the 1.0.1 palette.

## Downstream dependencies

None.
