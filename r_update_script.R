# THIS IS THE SCRIPT FOR UPDATING R FROM WITHIN RSTUDIO WITHOUT THE NEED FOR 
# MANUAL DOWNLOADS AND PACKAGE RE-INSTALLATION.
# 1. We have a section for updating R and it's packages.
# 2. We have a section of all R packages installed for my research work.

# Let's Rock and roll !!!



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# C1 - Updating R ---------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# The primary package for updating R from RStudio in Windows is "installr".
# Install packages (optional)
# install.packages("installr")
# Load packages for use
library(installr)
library(tidyverse)

# Checking for current R version
R.Version()                   # check for installed version 
sessionInfo()                 # checking alternative

# STEP 1: CHECK AND KEEP LIST OF INSTALLED R PACKAGES
# Before upgrading, we build a temp file with all of your old packages.
tmp <- installed.packages() 
installed_pkgs_old <- tmp |> as.data.frame()
installed_pkgs_old
View(installed_pkgs_old, title = "installed_pkgs_old")
# Save the pkg list for future use
saveRDS(installed_pkgs_old, "installed_pkgs_old_250709.rds")


# STEP 2: CHECK FOR UPDATES AND INSTALL R
installr::check.for.updates.R()
# Install latest R and update R packages
# NOTE: RUN THIS IN THE R GUI
# This cmd will require us to prompt before each step
installr::updateR()
# NOTE: We can not seem to find the location of the new R you have installed.
#       The rest of the updating process is aborted, please take care to 
#       copy your packages to the new R installation.
# Fast cmd with minimal prompts
installr::updateR(fast = TRUE)


# STEP 3: MANUALLY CHANGE R VERSION TO THE LATEST AND RESTART R 
# NO CODE.


# STEP 4: REINSTALL THE MISSING PACKAGES.
# Create vector of packages in the new R version
tmp <- installed.packages()
installed_pkgs_new <- as.vector(tmp[is.na(tmp[,"Priority"]), 1])
installed_pkgs_new
# Load old R pkg data
tmp <- readRDS("installed_pkgs_old_250709.rds")
installed_pkgs_old <- tmp$Package |> as.vector()
installed_pkgs_old
# Check which packages are missing from the old R version
miss_pkgs <- setdiff(installed_pkgs_old, installed_pkgs_new)
miss_pkgs
# Install the missing packages
install.packages(miss_pkgs)


# STEP 5: WE UPDATE RTOOLS AND THE R PACKAGES.
# Updating Rtools
installr::install.Rtools()
# ERROR: Download stops saying that the setup file is corrupted.
# Proceed for manual download and installation.

# Updating only the R packages
# NOTE: Before Updating R packages Restart R (ctrl+shift+f10). Ensure no 
#       extra packages are loaded.
update.packages(ask = F)



#_====
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# C2 - Installing and loading the required packages -----------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Installing the packages required for my usage
install.packages(c(
    # Data i/o
    "here",                 # relative file path
    "rio",                  # file import-export
    
    # Data manipulation
    "janitor",              # data cleaning fns
    "haven",                # stata, sas, spss data io
    "labelled",             # var labelling
    "readxl",               # excel sheets
    "scales",               # to change formats and units
    "skimr",                # quick data summary
    "broom",                # view model results
    
    # Data analysis
    "DHS.rates",            # demographic rates for dhs-like surveys
    "GeneralOaxaca",        # BO decomposition for non-linear
    "survey",               # apply survey weights
    
    # Analysis output
    "gt",
    "modelsummary",         # output summary tables
    "gtsummary",            # output summary tables
    "flextable",            # creating tables from objects
    "officer",              # editing in office docs
    
    # R graph related packages
    "ggstats",
    "RColorBrewer",
    "patchwork",
    
    # Misc packages
    "tidyverse",            # Data manipulation iron man
    "tictoc"                # Code timing
))


# Loading the required packages
easypackages::libraries(
    # Data i/o
    "here",                 # relative file path
    "rio",                  # file import-export
    
    # Data manipulation
    "janitor",              # data cleaning fns
    "haven",                # stata, sas, spss data io
    "labelled",             # var labelling
    "readxl",               # excel sheets
    # "scales",               # to change formats and units
    "skimr",                # quick data summary
    "broom",                # view model results
    
    # Data analysis
    "DHS.rates",            # demographic rates for dhs-like surveys
    "GeneralOaxaca",        # BO decomposition for non-linear
    "survey",               # apply survey weights
    
    # Analysis output
    "gt",
    # "modelsummary",          # output summary tables
    "gtsummary",            # output summary tables
    "flextable",            # creating tables from objects
    "officer",              # editing in office docs
    
    # R graph related packages
    "ggstats",
    "RColorBrewer",
    # "scales",
    "patchwork",
    
    # Misc packages
    "tidyverse",            # Data manipulation iron man
    "tictoc"                # Code timing
)


# TBD ####
























