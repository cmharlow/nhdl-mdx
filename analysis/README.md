# Plymouth State University Harvested Set Analysis & Mapping Notes

This directory contains analysis notes and field outputs used in the [mapping](https://docs.google.com/spreadsheets/d/1mfe6_TjKcrgT2htG8P8OPvOqIfdvAreFVmQNgTMrKAg/edit#gid=922456197). All of these were generated using the analysis scripts and bash.

Field usage across all sets:

```
{http://purl.org/dc/elements/1.1/}contributor: |==                       |   4347/48088 |   9%
    {http://purl.org/dc/elements/1.1/}creator: |=                        |   3251/48088 |   6%
       {http://purl.org/dc/elements/1.1/}date: |==========               |  19692/48088 |  40%
{http://purl.org/dc/elements/1.1/}description: |==========               |  19495/48088 |  40%
     {http://purl.org/dc/elements/1.1/}format: |===========              |  21967/48088 |  45%
 {http://purl.org/dc/elements/1.1/}identifier: |===========              |  22260/48088 |  46%
   {http://purl.org/dc/elements/1.1/}language: |                         |     76/48088 |   0%
   {http://purl.org/dc/elements/1.1/}relation: |======                   |  12352/48088 |  25%
     {http://purl.org/dc/elements/1.1/}rights: |===========              |  22160/48088 |  46%
     {http://purl.org/dc/elements/1.1/}source: |                         |    286/48088 |   0%
    {http://purl.org/dc/elements/1.1/}subject: |=========                |  18925/48088 |  39%
      {http://purl.org/dc/elements/1.1/}title: |===========              |  22259/48088 |  46%
       {http://purl.org/dc/elements/1.1/}type: |===========              |  22078/48088 |  45%
       {http://purl.org/dc/terms/}alternative: |                         |    830/48088 |   1%
           {http://purl.org/dc/terms/}created: |=                        |   2835/48088 |   5%
            {http://purl.org/dc/terms/}extent: |====                     |   9177/48088 |  19%
        {http://purl.org/dc/terms/}hasVersion: |==                       |   5558/48088 |  11%
        {http://purl.org/dc/terms/}isFormatOf: |                         |   1255/48088 |   2%
          {http://purl.org/dc/terms/}isPartOf: |========                 |  16233/48088 |  33%
       {http://purl.org/dc/terms/}isVersionOf: |======                   |  12340/48088 |  25%
            {http://purl.org/dc/terms/}medium: |                         |   1795/48088 |   3%
          {http://purl.org/dc/terms/}modified: |                         |   1211/48088 |   2%
        {http://purl.org/dc/terms/}provenance: |===========              |  21876/48088 |  45%
           {http://purl.org/dc/terms/}spatial: |=====                    |   9754/48088 |  20%
          {http://purl.org/dc/terms/}temporal: |                         |     33/48088 |   0%
```

## MAP & Mappings

The 6 PSU Collections mapped are consistent enough to have 1 primary XSLT and a consistent mapping across all 6 collections. This mapping is detailed here: https://docs.google.com/spreadsheets/d/1mfe6_TjKcrgT2htG8P8OPvOqIfdvAreFVmQNgTMrKAg/edit#gid=948424764.

## Collection Overviews

### p15828coll1

```
                dc:contributor: |                         |     20/1373 |   1%
                    dc:creator: |====                     |    268/1373 |  19%
                       dc:date: |================         |    907/1373 |  66%
                dc:description: |=====================    |   1192/1373 |  86%
                     dc:format: |=======================  |   1283/1373 |  93%
                 dc:identifier: |=========================|   1373/1373 | 100%
                   dc:language: |                         |     21/1373 |   1%
                     dc:rights: |======================== |   1367/1373 |  99%
                     dc:source: |                         |     24/1373 |   1%
                    dc:subject: |======================== |   1366/1373 |  99%
                      dc:title: |======================== |   1372/1373 |  99%
                       dc:type: |======================== |   1350/1373 |  98%
           dcterms:alternative: |============             |    661/1373 |  48%
                dcterms:extent: |=====================    |   1168/1373 |  85%
              dcterms:modified: |====================     |   1148/1373 |  83%
            dcterms:provenance: |======================== |   1368/1373 |  99%
               dcterms:spatial: |======================   |   1211/1373 |  88%
              dcterms:temporal: |                         |     20/1373 |   1%
```

### p15828coll3

```
         {http://purl.org/dc/elements/1.1/}contributor: |======                   |   4272/17132 |  24%
             {http://purl.org/dc/elements/1.1/}creator: |                         |    514/17132 |   3%
                {http://purl.org/dc/elements/1.1/}date: |======================   |  15128/17132 |  88%
         {http://purl.org/dc/elements/1.1/}description: |=====================    |  14813/17132 |  86%
              {http://purl.org/dc/elements/1.1/}format: |======================== |  16980/17132 |  99%
          {http://purl.org/dc/elements/1.1/}identifier: |=========================|  17132/17132 | 100%
            {http://purl.org/dc/elements/1.1/}relation: |==================       |  12352/17132 |  72%
              {http://purl.org/dc/elements/1.1/}rights: |=========================|  17132/17132 | 100%
             {http://purl.org/dc/elements/1.1/}subject: |====================     |  13978/17132 |  81%
               {http://purl.org/dc/elements/1.1/}title: |=========================|  17132/17132 | 100%
                {http://purl.org/dc/elements/1.1/}type: |======================== |  17010/17132 |  99%
                     {http://purl.org/dc/terms/}extent: |======                   |   4709/17132 |  27%
                 {http://purl.org/dc/terms/}hasVersion: |========                 |   5558/17132 |  32%
                   {http://purl.org/dc/terms/}isPartOf: |=======================  |  16233/17132 |  94%
                {http://purl.org/dc/terms/}isVersionOf: |==================       |  12340/17132 |  72%
                 {http://purl.org/dc/terms/}provenance: |=========================|  17132/17132 | 100%
                    {http://purl.org/dc/terms/}spatial: |========                 |   5912/17132 |  34%
```

### p15828coll4

```
                {http://purl.org/dc/elements/1.1/}date: |======================== |    360/374 |  96%
         {http://purl.org/dc/elements/1.1/}description: |=============            |    197/374 |  52%
              {http://purl.org/dc/elements/1.1/}format: |=========================|    374/374 | 100%
          {http://purl.org/dc/elements/1.1/}identifier: |=========================|    374/374 | 100%
              {http://purl.org/dc/elements/1.1/}rights: |===================      |    296/374 |  79%
             {http://purl.org/dc/elements/1.1/}subject: |======================== |    373/374 |  99%
               {http://purl.org/dc/elements/1.1/}title: |=========================|    374/374 | 100%
                {http://purl.org/dc/elements/1.1/}type: |=========================|    374/374 | 100%
```

### p15828coll5

```
             {http://purl.org/dc/elements/1.1/}creator: |=====================    |    262/304 |  86%
                {http://purl.org/dc/elements/1.1/}date: |=========================|    304/304 | 100%
         {http://purl.org/dc/elements/1.1/}description: |=========================|    304/304 | 100%
              {http://purl.org/dc/elements/1.1/}format: |======================   |    269/304 |  88%
          {http://purl.org/dc/elements/1.1/}identifier: |=========================|    304/304 | 100%
              {http://purl.org/dc/elements/1.1/}rights: |=========================|    304/304 | 100%
              {http://purl.org/dc/elements/1.1/}source: |=====================    |    262/304 |  86%
             {http://purl.org/dc/elements/1.1/}subject: |====================     |    249/304 |  81%
               {http://purl.org/dc/elements/1.1/}title: |=========================|    304/304 | 100%
                {http://purl.org/dc/elements/1.1/}type: |=========================|    304/304 | 100%
                {http://purl.org/dc/terms/}alternative: |=======                  |     87/304 |  28%
                     {http://purl.org/dc/terms/}extent: |======================   |    269/304 |  88%
                 {http://purl.org/dc/terms/}provenance: |=========================|    304/304 | 100%
```

### p15828coll6

```
                {http://purl.org/dc/elements/1.1/}date: |======================== |     79/82 |  96%
              {http://purl.org/dc/elements/1.1/}format: |=========================|     82/82 | 100%
          {http://purl.org/dc/elements/1.1/}identifier: |=========================|     82/82 | 100%
              {http://purl.org/dc/elements/1.1/}rights: |=========================|     82/82 | 100%
               {http://purl.org/dc/elements/1.1/}title: |=========================|     82/82 | 100%
                {http://purl.org/dc/elements/1.1/}type: |=========================|     82/82 | 100%
                {http://purl.org/dc/terms/}alternative: |=========================|     82/82 | 100%
                     {http://purl.org/dc/terms/}extent: |=========================|     82/82 | 100%
                 {http://purl.org/dc/terms/}provenance: |=========================|     82/82 | 100%
```

### p15828coll7

```
{http://purl.org/dc/elements/1.1/}contributor: |                         |     55/2932 |   1%
    {http://purl.org/dc/elements/1.1/}creator: |==================       |   2144/2932 |  73%
       {http://purl.org/dc/elements/1.1/}date: |======================== |   2851/2932 |  97%
{http://purl.org/dc/elements/1.1/}description: |======================== |   2926/2932 |  99%
     {http://purl.org/dc/elements/1.1/}format: |======================== |   2916/2932 |  99%
 {http://purl.org/dc/elements/1.1/}identifier: |=========================|   2932/2932 | 100%
   {http://purl.org/dc/elements/1.1/}language: |                         |     55/2932 |   1%
     {http://purl.org/dc/elements/1.1/}rights: |======================== |   2916/2932 |  99%
    {http://purl.org/dc/elements/1.1/}subject: |======================== |   2896/2932 |  98%
      {http://purl.org/dc/elements/1.1/}title: |=========================|   2932/2932 | 100%
       {http://purl.org/dc/elements/1.1/}type: |======================== |   2895/2932 |  98%
           {http://purl.org/dc/terms/}created: |======================== |   2835/2932 |  96%
            {http://purl.org/dc/terms/}extent: |======================== |   2886/2932 |  98%
        {http://purl.org/dc/terms/}isFormatOf: |==========               |   1255/2932 |  42%
            {http://purl.org/dc/terms/}medium: |===============          |   1795/2932 |  61%
        {http://purl.org/dc/terms/}provenance: |======================== |   2927/2932 |  99%
           {http://purl.org/dc/terms/}spatial: |======================   |   2582/2932 |  88%
          {http://purl.org/dc/terms/}temporal: |                         |     13/2932 |   0%
```

### p15828coll12

```
             {http://purl.org/dc/elements/1.1/}creator: |=========================|     63/63 | 100%
                {http://purl.org/dc/elements/1.1/}date: |=========================|     63/63 | 100%
         {http://purl.org/dc/elements/1.1/}description: |=========================|     63/63 | 100%
              {http://purl.org/dc/elements/1.1/}format: |=========================|     63/63 | 100%
          {http://purl.org/dc/elements/1.1/}identifier: |=========================|     63/63 | 100%
              {http://purl.org/dc/elements/1.1/}rights: |=========================|     63/63 | 100%
             {http://purl.org/dc/elements/1.1/}subject: |=========================|     63/63 | 100%
               {http://purl.org/dc/elements/1.1/}title: |=========================|     63/63 | 100%
                {http://purl.org/dc/elements/1.1/}type: |=========================|     63/63 | 100%
                     {http://purl.org/dc/terms/}extent: |=========================|     63/63 | 100%
                   {http://purl.org/dc/terms/}modified: |=========================|     63/63 | 100%
                 {http://purl.org/dc/terms/}provenance: |=========================|     63/63 | 100%
                    {http://purl.org/dc/terms/}spatial: |===================      |     49/63 |  77%
```
