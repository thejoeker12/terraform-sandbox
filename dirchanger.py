import os

BASE_DIR = "/Users/joseph/Github/terraform-provider-jamfpro/internal/resources/"
dirList = os.listdir("/Users/joseph/Github/terraform-provider-jamfpro/internal/resources")
for fname in dirList:
    if fname != "common":
        fdir = BASE_DIR + fname
        files = os.listdir(fdir)
        for f in files:
            newFn = f.split("_", 1)[1]
            newdir = BASE_DIR + fname + "/" + newFn
            oldDir = BASE_DIR + fname + "/" + f
            os.rename(oldDir, newdir)