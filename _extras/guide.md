---
layout: page
title: "Instructor Notes"
---

## Dataset

De oprindelige data kan findes her:
<https://figshare.com/articles/SAFI_Survey_Results/6262019>.

Vi bruger en meget neddroslet udgave af data, der kan downloades her:
<https://raw.githubusercontent.com/KUBDatalab/beginning-R/main/data/SAFI_clean.csv>.

Vær sikker på at de studerende faktisk får downloaded data til rette mappe
under introduktionen til R og RStudio. Vær særligt opmærksom på at visse
styresystemer er case-sensitive, og læg vægt på at de skal downloade til
"data"-mappen og ikke "Data".

Har de ikke oprettet en `data` mappe vil `download.file()` give en fejl. Det er 
særligt vigtigt at de har styr på det!

## RStudio og flere R installationer

Nogle studerende kan have flere R instalationer. På Macs vil en ny installation
føre til at styresystemet skaber et symbolsk link der peger på den nye installation
som 'Current'. Undertiden går det galt, og selvom den nye R-installation kan tilgås,
kan RStudio ikke finde den. 
Det kan føre til at den studerende kører på en ældre R-installation, og få 
installation af pakker til at fejl. Det kan løses på terminalen.

Start med at tjekke at den rette R-installation:

```
ls -l /Library/Frameworks/R.framework/Versions/
```

Pt bruger vi R >=4.2. Hvis den ikke er der, skal den installeres.
Hvis den er - skal det symbolske link sættes til Current sættes til at pege på 
R >=4.2 kataloget:

```
ln -s /Library/Frameworks/R.framework/Versions/4.x.y /Library/Frameworks/R.framework/Version/Current
```
Genstart herefter RStudio.


## Narrative

### Before we start

* Det primære formål er at introducere de studerende til RStudios interface. 
  Vi bruger RStudio fordi det gør brugen af R mere organiseret - og om ikke
  bruger_venlig_ så bruger_venligere_.
* Gå langsomt frem her. Alle skal følge med, så mappestrukturen, installation
  af `tidyverse` og download af data er på plads for alle.
* Vi bruger projekter her. Det løser problemet med working directory. Erfaringen
  viser at mange studerende ikke fanger at de skal oprette et projekt. Sørg for 
  at de alle får det på plads.


### Introduction to R

* Hvorfor bruger vi assignment operatoren (<-) og ikke lighedstegn?
  Konceptet stammer tilbage fra programmeringssproget S, som R bygger på. 
  i S er <- inspireret fra programmeringssproget APL, der kom med eget tastatur; 
  hvor <- eksisterede. Fordi == ikke eksisterede som logisk test (man brugte =),
  blev <- brugt til at assigne varible. 
  Der er ikke mange rigtig gode årsager til at bruge <- i stedet for = i dag. 
  Assignment er højere i operator hierarkiet end =. Men hvis du skal assigne
  værdier til variable inde i funktioner, er <- den eneste mulighed. 
  Det fører også til at koden bliver lettere at læse. Bruger vi konsekvent <- til
  assignment, er det tydeligt at det er det vi gør. Det betyder at vi kan være
  sikre på at når = optræder, er det fordi et argument sættes.
* Når du når til spørgsmålet om hvad `area_acres` mon er, så giv den lidt tid til
  at tænke. Det er et vigtigt, og for nye programmører ukendt koncept.
* Husk at bruge lidt tid på manglende data. Det er et vigtigt koncept i dataanalyse.

### Starting with data

The two main goals for this lessons are:

* To make sure that learners are comfortable with working with data frames, and
  can use the bracket notation to select slices/columns.
* To expose learners to factors. Their behavior is not necessarily intuitive,
  and so it is important that they are guided through it the first time they are
  exposed to it. The content of the lesson should be enough for learners to
  avoid common mistakes with them.

### Manipulating data with dplyr

* This lesson works better if you have graphics demonstrating dplyr commands.
  You can modify [this Google Slides deck](https://docs.google.com/presentation/d/1A9abypFdFp8urAe9z7GCMjFr4aPeIb8mZAtJA2F7H0w/edit#slide=id.g652714585f_0_114) and use it for your workshop.
* For this lesson make sure that learners are comfortable using pipes.
* There is also sometimes some confusion on what the arguments of `group_by`
  should be, and when to use `filter()` and `select()`.
* If the code that generates the output for the table `interviews_plotting` (which is used in the following episode) causes the following error:

> Error: Can't rename columns that don't exist.  
> x Column NA doesn't exist.
    
Make sure you have read in the CSV file with the option that interprets the `"NULL"` string as `NA`, like so: 
    
```
interviews <- read_csv("data/SAFI_clean.csv", na = "NULL")
```  

### Visualizing data with ggplot2

* This lesson is a broad overview of ggplot2 and focuses on (1) getting familiar
  with the layering system of ggplot2, (2) using the argument `group` in the
  `aes()` function, (3) basic customization of the plots.


## Technical Tips and Tricks

Show how to use the 'zoom' button to blow up graphs without constantly resizing
windows.

Sometimes a package will not install. You can try a different CRAN mirror:
- Tools > Global Options > Packages > CRAN Mirror

Alternatively you can go to CRAN and download the package and install from ZIP
file:
-   Tools > Install Packages > set to 'from Zip/TAR'

It is important that R, and the R packages be installed locally, not on a network
drive. If a learner is using a machine with multiple users where their account is
not based locally this can create a variety of issues (this often happens on
university computers). Hopefully the learner will realize these issues beforehand,
but depending on the machine and how the IT folks that service the computer have
things set up, it may be very difficult to impossible to make R work without their
help.

If learners are having issues with one package, they may have issues with another.
It's often easier to make sure they have all the needed packages installed at one
time, rather than deal with these issues over and over. 
[Here is a list of all necessary packages for these lessons.](https://github.com/datacarpentry/R-ecology-lesson/blob/master/needed_packages.R)

**`|` character on Spanish keyboards:** The Spanish Mac keyboard does not have a `|` key. 
This character can be created using: 
```
`alt` + `1`
```


## Other Resources

If you encounter a problem during a workshop, feel free to contact the
maintainers by email or [open an
issue](https://github.com/datacarpentry/r-socialsci/issues/new).

For a more in-depth coverage of topics of the workshops, you may want to read "[R for Data Science](http://r4ds.had.co.nz/)" by Hadley Wickham and Garrett Grolemund.
