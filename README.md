# New Hampshire Digital Library Metadata Transforms

This repository contains some of the data analysis, modeling, and transformation (XSLT) work to be used by the New Hampshire Digital Library as part of an emerging DPLA hub.

It was built in Summer 2019.

## Files included

- [`analysis`](analysis) contains notes and reports used in writing the mappings and normalization rules
- [`analysisScripts`](analysisScripts) contains scripts used in analysis and normalization outputs (the latter primarily being generating a geonames remediation file, which is still a work in progress)
- [`xslt`](xslt) contains the XSLT for the Plymouth State University OAI Collections to be transformed to a proposed NHDL metadata application profile published primarily for DPLA harvesting.

## Proposed NHDL MAP Information

The proposed NHDL metadata application profile is documented [here](https://docs.google.com/spreadsheets/d/1mfe6_TjKcrgT2htG8P8OPvOqIfdvAreFVmQNgTMrKAg/edit#gid=948424764). This MAP focuses on
1. making the NHDL MAP flat for ease of analysis and transformation;
2. as close as possible to existing DPLA Hub [Qualified Dublin Core sources (in particular Ohio and District Digital)](https://docs.google.com/spreadsheets/d/1nUQmlW959p3j9sR-ic5cYL66mGUSIoIuSD550Ic1hk4/edit#gid=1503963979) for which crosswalks exist (so the DPLA tech team has an easier time ingesting this);
3. and mapping over fields that are only used by the targeted end DPLA MAP v.5 instead of trying to map over and normalize everything possible.

## XSLT Information

### Structure & Expansion Paths

The XSLT is written in 3 levels:
- collection-specific XSLT (`xslt/p15828coll*.xslt`): these are the files you actually run against the desired XML files. This imports the provider-specific XSLT (next).
- provider-specific XSLT (`xslt/psu.xslt`): this file is imported above and contains XML node templates that are reused across collections. If/when collections are consistent enough to use the same XSLT, this can be made into that. This imports the remediation XSLT (next).
- remediation-specific XSLT (`xslt/remediation.xslt`): this file has lookup parameters used by the above templates to normalize string values against a variety of vocabularies, including DCMI Types, the DPLA-recommended Getty AAT subset, Lexvo Language look-ups, targeted Geonames look-ups, month abbreviations, etc.

To run one of the collection-specific XSLT, you need to have all 3 files (collection specific XSLT, `psu.xslt`, and `remediation.xslt`) in the same directory.

### Reconciliation & Lookups

The remediation XSLT is generated to allow string to normalized string or URI lookups within the XSLT. You can expand it to have multiple string to desired value mappings; or change the XSLT templates using the lookups to match on whole strings (`matches()` or `. = $lookup/@string`), partial strings (`contains()`), or other aspects (`starts-with()`. `ends-with()`, etc.).

The longer vocabularies (e.g. Geonames) are targeted subsets, meaning we using the analysis scripts (or other means) to generate lists of the string in our source data that we wish to have reconciled (e.g. `dcterms:spatial`), then we run a script to match that against an external value and pull back what we wish to use in our lookup (the URI, external identifier, perhaps the normalized label, etc.). The output of this script is the XSLT param table we then put in `xslt/remediation.xslt`, and that is loaded and used with the XSLT templates that call it.

### Using XSLT in Combine

Combine has specific hangouts when using XSLT that imports other XSLT documents. See: https://combine.readthedocs.io/en/master/configuration.html?highlight=xslt#local-includes

Basically, to load these XSLT documents into Combine, the `psu.xslt` document requires a change at the top to either import a HTTP URL of the `remediation.xslt` file (like a raw document GitHub URL) or be changed *in Combine* to reference the auto-generated filepath for `remediation.xslt` within Combine. For the collection-specific XSLT documents, you need to change the import at the top of the document to either import a HTTP URL for `psu.xslt` or the Combine-generated filepath for `psu.xslt`.

If the above fails, a last ditch effort is to copy over `remediation.xslt` into `psu.xslt`, then copy over that aggregated `psu.xslt`into the collection-specific documents. This is less than ideal, as you lose the DRY (don't repeat yourself) structure of the XSLT.

## Questions

- Check with DPLA about whether or not to include URIs or just normalized labels (strings)

The relevant URIs are for DCMI Types (`dcterms:type`), DPLA-recommended Getty AAT Subtypes (`edm:hasType`), RightsStatement.org or Creative Commons URI (`edm:rights`), and Geonames URIs (`dcterms:spatial`).

If no, it is easy enough to remove them from the template. Alternatively, it is a similar process to remove the labels if they only want the URIs. This will change the on-going spatial / Geonames work.

- Check the hard-coded values are what the NHDL what

These include the hub name (see `psu.xslt`); the data provider default (`psu.xslt` defaults to `Plymouth State University` after checking for the digital repository name in `dcterms:provenance`); and the inclusion within each collection-level XSLT of the digital collection name.

- Missing required fields:
  - No `dc:title`:
    - oai:digitalcollections.plymouth.edu:p15828coll1/246
  - No `dc:rights`:
    - oai:digitalcollections.plymouth.edu:p15828coll7/1278
    - oai:digitalcollections.plymouth.edu:p15828coll7/1281
    - oai:digitalcollections.plymouth.edu:p15828coll7/1284
    - oai:digitalcollections.plymouth.edu:p15828coll7/1287
    - oai:digitalcollections.plymouth.edu:p15828coll7/1290
    - oai:digitalcollections.plymouth.edu:p15828coll7/1293
    - oai:digitalcollections.plymouth.edu:p15828coll7/1296
    - oai:digitalcollections.plymouth.edu:p15828coll7/1299
    - oai:digitalcollections.plymouth.edu:p15828coll7/1302
    - oai:digitalcollections.plymouth.edu:p15828coll7/2701
    - oai:digitalcollections.plymouth.edu:p15828coll7/2702
    - oai:digitalcollections.plymouth.edu:p15828coll7/2728
    - oai:digitalcollections.plymouth.edu:p15828coll7/2729
    - oai:digitalcollections.plymouth.edu:p15828coll7/4706
    - oai:digitalcollections.plymouth.edu:p15828coll7/6694
    - oai:digitalcollections.plymouth.edu:p15828coll7/6695
    - oai:digitalcollections.plymouth.edu:p15828coll4/3213
    - oai:digitalcollections.plymouth.edu:p15828coll4/3214
    - oai:digitalcollections.plymouth.edu:p15828coll4/3215
    - oai:digitalcollections.plymouth.edu:p15828coll4/3216
    - oai:digitalcollections.plymouth.edu:p15828coll4/3217
    - oai:digitalcollections.plymouth.edu:p15828coll4/3218
    - oai:digitalcollections.plymouth.edu:p15828coll4/3219
    - oai:digitalcollections.plymouth.edu:p15828coll4/3220
    - oai:digitalcollections.plymouth.edu:p15828coll4/3221
    - oai:digitalcollections.plymouth.edu:p15828coll4/3222
    - oai:digitalcollections.plymouth.edu:p15828coll4/3223
    - oai:digitalcollections.plymouth.edu:p15828coll4/3224
    - oai:digitalcollections.plymouth.edu:p15828coll4/3225
    - oai:digitalcollections.plymouth.edu:p15828coll4/3226
    - oai:digitalcollections.plymouth.edu:p15828coll4/3227
    - oai:digitalcollections.plymouth.edu:p15828coll4/3228
    - oai:digitalcollections.plymouth.edu:p15828coll4/3229
    - oai:digitalcollections.plymouth.edu:p15828coll4/3230
    - oai:digitalcollections.plymouth.edu:p15828coll4/3231
    - oai:digitalcollections.plymouth.edu:p15828coll4/3232
    - oai:digitalcollections.plymouth.edu:p15828coll4/3233
    - oai:digitalcollections.plymouth.edu:p15828coll4/3234
    - oai:digitalcollections.plymouth.edu:p15828coll4/3235
    - oai:digitalcollections.plymouth.edu:p15828coll4/3236
    - oai:digitalcollections.plymouth.edu:p15828coll4/3237
    - oai:digitalcollections.plymouth.edu:p15828coll4/3238
    - oai:digitalcollections.plymouth.edu:p15828coll4/3239
    - oai:digitalcollections.plymouth.edu:p15828coll4/3240
    - oai:digitalcollections.plymouth.edu:p15828coll4/3241
    - oai:digitalcollections.plymouth.edu:p15828coll4/3242
    - oai:digitalcollections.plymouth.edu:p15828coll4/3243
    - oai:digitalcollections.plymouth.edu:p15828coll4/3244
    - oai:digitalcollections.plymouth.edu:p15828coll4/3245
    - oai:digitalcollections.plymouth.edu:p15828coll4/3246
    - oai:digitalcollections.plymouth.edu:p15828coll4/3247
    - oai:digitalcollections.plymouth.edu:p15828coll4/3248
    - oai:digitalcollections.plymouth.edu:p15828coll4/3249
    - oai:digitalcollections.plymouth.edu:p15828coll4/3250
    - oai:digitalcollections.plymouth.edu:p15828coll4/3251
    - oai:digitalcollections.plymouth.edu:p15828coll4/3252
    - oai:digitalcollections.plymouth.edu:p15828coll4/3253
    - oai:digitalcollections.plymouth.edu:p15828coll4/3254
    - oai:digitalcollections.plymouth.edu:p15828coll4/3255
    - oai:digitalcollections.plymouth.edu:p15828coll4/3256
    - oai:digitalcollections.plymouth.edu:p15828coll4/3257
    - oai:digitalcollections.plymouth.edu:p15828coll4/3258
    - oai:digitalcollections.plymouth.edu:p15828coll4/3259
    - oai:digitalcollections.plymouth.edu:p15828coll4/3260
    - oai:digitalcollections.plymouth.edu:p15828coll4/3264
    - oai:digitalcollections.plymouth.edu:p15828coll4/3265
    - oai:digitalcollections.plymouth.edu:p15828coll4/3266
    - oai:digitalcollections.plymouth.edu:p15828coll4/3267
    - oai:digitalcollections.plymouth.edu:p15828coll4/3268
    - oai:digitalcollections.plymouth.edu:p15828coll4/3269
    - oai:digitalcollections.plymouth.edu:p15828coll4/3270
    - oai:digitalcollections.plymouth.edu:p15828coll4/3271
    - oai:digitalcollections.plymouth.edu:p15828coll4/3272
    - oai:digitalcollections.plymouth.edu:p15828coll4/3273
    - oai:digitalcollections.plymouth.edu:p15828coll4/3274
    - oai:digitalcollections.plymouth.edu:p15828coll4/3276
    - oai:digitalcollections.plymouth.edu:p15828coll4/3277
    - oai:digitalcollections.plymouth.edu:p15828coll4/3278
    - oai:digitalcollections.plymouth.edu:p15828coll4/3279
    - oai:digitalcollections.plymouth.edu:p15828coll4/3280
    - oai:digitalcollections.plymouth.edu:p15828coll4/3291
    - oai:digitalcollections.plymouth.edu:p15828coll4/3292
    - oai:digitalcollections.plymouth.edu:p15828coll4/3293
    - oai:digitalcollections.plymouth.edu:p15828coll4/3294
    - oai:digitalcollections.plymouth.edu:p15828coll4/3295
    - oai:digitalcollections.plymouth.edu:p15828coll4/3296
    - oai:digitalcollections.plymouth.edu:p15828coll4/3297
    - oai:digitalcollections.plymouth.edu:p15828coll4/3298
    - oai:digitalcollections.plymouth.edu:p15828coll4/3299
    - oai:digitalcollections.plymouth.edu:p15828coll4/3300
    - oai:digitalcollections.plymouth.edu:p15828coll4/3301
    - oai:digitalcollections.plymouth.edu:p15828coll4/3302
    - oai:digitalcollections.plymouth.edu:p15828coll4/3303
    - oai:digitalcollections.plymouth.edu:p15828coll4/3304
    - oai:digitalcollections.plymouth.edu:p15828coll1/246
    - oai:digitalcollections.plymouth.edu:p15828coll1/597
    - oai:digitalcollections.plymouth.edu:p15828coll1/2415
    - oai:digitalcollections.plymouth.edu:p15828coll1/2426
    - oai:digitalcollections.plymouth.edu:p15828coll1/2442
    - oai:digitalcollections.plymouth.edu:p15828coll1/2482
