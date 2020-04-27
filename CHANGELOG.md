# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2020-04-27
### Added
- Matching to the twist-2 operators below the EW scale
- The running and mixing of twist-2 operators below the EW scale and NR matching
### Changed
- Renamed the "DMEFT" basis to "6Flavor" for naming consistency
### Fixed
- Updated values in `inputs.m` to PDG 2018
- Removed unneeded call to `adms/dim5.m` in `Kernel/init.m` which was causing an error upon loading of `DirectDM` (thanks to Diego Guadagnoli and Mraco Fedele for reporting it)
- Minus-sign typos in anomalous dimensions for mixing of GG and GGdual operators into scalar and pseudoscalar quark opearators


## [1.1.0] - 2019-02-28
### Added
- This version implements the matching at the EW scale in anticipation of version 2 of the code which will implement the RG running above the EW scale. The operator basis above the EW scale is defined in the following files:
   - `dmeft.m`
   - `xxeft.m`
   - `smeft.m`
- The matching is implemented in `matchew.m`
- Added new functions to set the hypercharge and isospin of the DM multiplet and to set the EFT scale.
### Changed
- Electroweak inputs in `inputs.m`; mainly changed the definition of the Higgs vev in terms of the Fermi constant.
### Fixed
- Bug in `formfactors.m`: pion exchange matching contribution of `Q_4^(7)` to `O_{NR,6}^n` -- thanks to Felix Kahlhoefer for pointing it out. 

## [1.0.1] - 2017-11-01
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
