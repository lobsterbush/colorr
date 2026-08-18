## R CMD check results

0 errors | 0 warnings | 1 note

## Note

    New maintainer:
      Charles Crabtree <charles.crabtree@monash.edu>
    Old maintainer(s):
      Charles Crabtree <ccrabtr@umich.edu>

The maintainer has not changed. I am the same person and the sole author of the
package. The address on the 2017 release, ccrabtr@umich.edu, was my University of
Michigan graduate address; I have since moved to Monash University, and
charles.crabtree@monash.edu is my current institutional address. Please let me know
what confirmation you would like for the change and I will provide it.

## Test environments

* local macOS (aarch64-apple-darwin20), R 4.5.2
* win-builder (R-devel and R-release)

## About this release

This is a feature release over the 1.0.0 currently on CRAN. Palettes are refreshed to
the current season, the WNBA and five more soccer leagues are added, and the package
gains ggplot2 colour and fill scales. It adds one new dependency, ggplot2, for those
scales.

The release is backwards compatible. Every team name accepted by 1.0.0 still resolves,
and every palette function takes `legacy = TRUE`, which returns the palette that
shipped with the earlier release so existing figures still reproduce.

## Downstream dependencies

None.
