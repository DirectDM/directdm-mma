# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2017-10-25
### Added
- This `CHANGELOG.md` file.
- The arXiv number of the companion paper for the low energy constant values.
- `DirectDM/formfactors.m` and related changes to implement the form factor expressions in [1708.02678](https://arxiv.org/abs/1708.02678).
- NLO option to the `ComputeCoeffs` function.
### Changed
- Alpha_EM value for matching at 2GeV is now Alpha_EM(0) rather than Alpha_EM(M_Tau).
- Low energy constants to match [1708.02678](https://arxiv.org/abs/1708.02678).
### Fixed
- Extra factor of 2 in Majorana and real scalar matching.
- Alpha_s flavor scheme for running between 3 and 2 GeV.
- Minus sign and factor of 2 in anomalous dim. for GGdual mixing in pseudo-scalar current.
### Removed
- Unneeded comments in the code.

## [1.0.0] - 2017-08-10
### Added
**Initial release**
- `DirectDM` package folder
- `example.m`
- `README.md`
- `LICENCE`
