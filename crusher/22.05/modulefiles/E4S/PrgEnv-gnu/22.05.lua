whatis([[
	The Extreme-scale Scientific Software Stack (E4S) is a collection of open source software packages for running scientific applications on high-performance computing (HPC) platforms. 
        ]])
help([[ The Extreme-scale Scientific Software Stack (E4S) is a community effort to provide open source software packages for developing, deploying and running scientific applications on high-performance computing (HPC) platforms. E4S provides from-source builds and containers of a broad collection of HPC software packages.

References:
  - E4S User Docs: https://e4s.readthedocs.io/en/latest/index.html
  - E4S Homepage: https://e4s-project.github.io/ 
  - E4S GitHub: https://github.com/E4S-Project/e4s
	]])

local root = "/gpfs/alpine/csc439/world-shared/E4S/ParaTools/22.05/PrgEnv-gnu/spack"

prepend_path("MODULEPATH", "/gpfs/alpine/csc439/world-shared/E4S/ParaTools/22.05/PrgEnv-gnu/spack/share/spack/lmod/cray-sles15-x86_64/Core")
depends_on("PrgEnv-gnu")
depends_on("gcc/11.2.0")
depends_on("cray-mpich")

-- setup spack shell functionality
local shell = myShellType()
if (mode() == "load") then
    local spack_setup = ''
    if (shell == "sh" or shell == "bash" or shell == "zsh") then
         spack_setup = pathJoin(root, "share/spack/setup-env.sh")
    elseif (shell == "csh") then
         spack_setup = pathJoin(root, "share/spack/setup-env.csh")
    elseif (shell == "fish")  then
         spack_setup = pathJoin(root, "share/spack/setup-env.fish")
    end

    -- If we are unable to find spack setup script let's terminate now. 
    if not isFile(spack_setup) then
        LmodError("Unable to find spack setup script " .. spack_setup .. "\n")
    end

    execute{cmd="source " .. spack_setup, modeA={"load"}}

-- To remove spack from shell we need to remove a few environment variables, alias and remove $SPACK_ROOT/bin from $PATH
elseif (mode() == "unload" or mode() == "purge") then
    if (shell == "sh" or shell == "bash" or shell == "zsh") then
      execute{cmd="unset SPACK_ENV",modeA={"unload"}}
      execute{cmd="unset SPACK_ROOT",modeA={"unload"}}
      execute{cmd="unset -f spack",modeA={"unload"}}
    elseif (shell == "csh") then
      execute{cmd="unsetenv SPACK_ENV",modeA={"unload"}}
      execute{cmd="unsetenv SPACK_ROOT",modeA={"unload"}}
      execute{cmd="unalias spack",modeA={"unload"}}
    end

    -- Need to remove $SPACK_ROOT/bin from $PATH which removes the 'spack' command 
    remove_path("PATH", pathJoin(root, "bin"))
    remove_path("MODULEPATH", "/gpfs/alpine/csc439/world-shared/E4S/ParaTools/22.05/PrgEnv-gnu/spack/share/spack/lmod/cray-sles15-x86_64/Core")
end
