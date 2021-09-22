if (!dir.exists("data"))
    dir.create("data")

if (! file.exists("data/SAFI_clean.csv")) {
    download.file("https://raw.githubusercontent.com/KUBDatalab/beginning-R/main/data/SAFI_clean.csv",
                  "data/SAFI_clean.csv", mode = "wb")
}
