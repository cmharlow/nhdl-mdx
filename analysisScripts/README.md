# NHDL Analysis Scripts

This directory contains primarily 3 scripts:
- harvestOAI.py
- analyzeCDM.py
- generateGeonames.py (WIP)

These are Python 3 scripts used to run basic tasks used in the analysis, mapping and normalization rules written in the XSLT in this repository. They are not necessary for running the XSLT files, but they are helpful for changing and enhancing them.

These are derived from work originally based on the following:
- [pyoaiharvester](https://github.com/vphill/pyoaiharvester)
- [metadata_breakers](https://github.com/vphill/metadata_breakers)
- [Metadata Analysis at the Command Line](http://journal.code4lib.org/articles/7818)

## Requirements

- Python (preferably 3.7; follow .python-version in top level); Untested on Python 2.
- pipenv (and pip; usually included with modern installations of Python 3).

## Install

We run the Python & Bash commands within a pipenv shell where our requirements are installed from the Pipfile & Pipfile.lock. To setup the pipenv shell & install required libraries:

1. Get this repository on your computer somehow. You can:
    1. change to file location where you want these scripts, then clone this git repository to your computer:
    ```
    $ git clone https://github.com/cmharlow/nhdl-mdx.git
    ```
    1. download this repository to your computer from the GitHub page - use the 'Download Zip' button in bottom right corner. Move the zip file to the place you wish to have these scripts, then unzip.
2. Change into the analysis scripts directory:
  ```
  $ cd analysisScripts/
  ```
3. run `pipenv install`
4. run `pipenv shell`

Now you should be ready to use the scripts. When you are done, close the pipenv shell via running `deactivate`

## Harvesting OAI Feed

usage: python oaiharvest.py [options, see below] -l link to OAI feed -o file to save to.

optional arguments:

- -h: a help message
- -l: URL of OAI repository (defaults to `http://digitalcollections.plymouth.edu/oai/oai.php`)
- -o: write repository to this file
- -f: harvest records from this date yyyy-mm-dd
- -u: harvest records until this date yyyy-mm-dd
- -m: use the specified metadata format (defaults to `oai_qdc`)
- -s: harvest the specified set

This downloads all the QDC/XML data from the OAI feed at Plymouth State University, and saves it to the file 'sample.qdc.xml'.
```
$ python oaiharvest.py -m qdc -o sample.qdc.xml
```

### Analysis

All of the analysis scripts run similarly to what is described by Mark Phillips here for his own work: [Metadata Analysis at the Command Line](http://journal.code4lib.org/articles/7818)

usage: oaidc_analysis.py data_filename.xml [options, see below]

positional arguments:

- datafile              put the datafile you want analyzed here

optional arguments:

- -h: show a help message
- -e: element to print to screen (use known prefixes like `qdc`, `dcterms`, `dc`, `edm`)
- -i: prepend meta_id/OAI header id for record to line
- -s: only print stats for repository (default)
- -p: print TRUE / FALSE if there is value of defined element in record

To get a field report:

```
$ python analysisCDM.py sample.qdc.xml
```

To get all the values for the dc:creator field:

```
$ python analysisCDM.py sample.qdc.xml -e dc:creator  
```

To get all the unique values for the dc:creator field, sorted by count, using bash:

```
$ python analysisCDM.py test/output.xml -e dc:creator | sort | uniq -c  
```
