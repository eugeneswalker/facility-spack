whatis([[
	The Extreme-scale Scientific Software Stack (E4S) is a collection of open source software packages for running scientific applications on high-performance computing (HPC) platforms. 
        ]])
help([[ The Extreme-scale Scientific Software Stack (E4S) is a community effort to provide open source software packages for developing, deploying and running scientific applications on high-performance computing (HPC) platforms. E4S provides from-source builds and containers of a broad collection of HPC software packages.

References:
  - E4S User Docs: https://e4s.readthedocs.io/en/latest/index.html
  - E4S Homepage: https://e4s-project.github.io/ 
  - E4S GitHub: https://github.com/E4S-Project/e4s
	]])

-- prepend_path("MODULEPATH", "/gpfs/alpine/csc439/world-shared/E4S/ParaTools/22.05/PrgEnv-gnu/spack/share/spack/lmod/cray-sles15-x86_64/Core")
execute { cmd="module use /gpfs/alpine/csc439/world-shared/E4S/ParaTools/22.05/PrgEnv-gnu/spack/share/spack/lmod/cray-sles15-x86_64/Core", modeA={"load"}}
execute { cmd="module unuse /gpfs/alpine/csc439/world-shared/E4S/ParaTools/22.05/PrgEnv-gnu/spack/share/spack/lmod/cray-sles15-x86_64/Core", modeA={"unload"}}
always_load("PrgEnv-gnu")
always_load("gcc/11.2.0")
load("cray-mpich")
-- depends_on("PrgEnv-gnu")
-- depends_on("gcc/11.2.0")
-- depends_on("cray-mpich")
