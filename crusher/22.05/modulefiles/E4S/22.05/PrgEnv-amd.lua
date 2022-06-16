whatis([[
	The Extreme-scale Scientific Software Stack (E4S) is a collection of open source software packages for running scientific applications on high-performance computing (HPC) platforms. 
        ]])
help([[ The Extreme-scale Scientific Software Stack (E4S) is a community effort to provide open source software packages for developing, deploying and running scientific applications on high-performance computing (HPC) platforms. E4S provides from-source builds and containers of a broad collection of HPC software packages.

References:
  - E4S User Docs: https://e4s.readthedocs.io/en/latest/index.html
  - E4S Homepage: https://e4s-project.github.io/ 
  - E4S GitHub: https://github.com/E4S-Project/e4s
	]])

prepend_path("MODULEPATH", "/gpfs/alpine/csc439/world-shared/E4S/ParaTools/22.05/PrgEnv-amd/spack/share/spack/lmod/cray-sles15-x86_64/Core")
depends_on("PrgEnv-amd")
depends_on("amd/5.1.0")
depends_on("cray-mpich")