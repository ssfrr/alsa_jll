# Autogenerated wrapper script for alsa_jll for x86_64-linux-gnu
export libatopology, libasound

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libatopology`
const libatopology_splitpath = ["lib", "libatopology.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libatopology_path = ""

# libatopology-specific global declaration
# This will be filled out by __init__()
libatopology_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libatopology = "libatopology.so.2"


# Relative path to `libasound`
const libasound_splitpath = ["lib", "libasound.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libasound_path = ""

# libasound-specific global declaration
# This will be filled out by __init__()
libasound_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libasound = "libasound.so.2"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"alsa")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    LIBPATH_list = [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]
    global libatopology_path = normpath(joinpath(artifact_dir, libatopology_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libatopology_handle = dlopen(libatopology_path)
    push!(LIBPATH_list, dirname(libatopology_path))

    global libasound_path = normpath(joinpath(artifact_dir, libasound_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libasound_handle = dlopen(libasound_path)
    push!(LIBPATH_list, dirname(libasound_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

