<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/"
    xmlns:nhdl="http://github.com/cmharlow/nhdl-mdx/"
    xmlns:oclcdc="http://worldcat.org/xmlschemas/oclcdc-1.0/"
    xmlns:oclcterms="http://purl.org/oclc/terms/"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/"
    xmlns:oai_dc='http://www.openarchives.org/OAI/2.0/oai_dc/'
    xmlns:oclc="http://purl.org/oclc/terms/"
    version="2.0">

    <!-- lookup table for recommended DCMI Types terms/URIs -->
    <xsl:param name="dcmiType">
        <nhdl:type string="collection" uri="http://purl.org/dc/dcmitype/Collection">collection</nhdl:type>
        <nhdl:type string="dataset" uri="http://purl.org/dc/dcmitype/Dataset">dataset</nhdl:type>
        <nhdl:type string="event" uri="http://purl.org/dc/dcmitype/Event">event</nhdl:type>
        <nhdl:type string="image" uri="http://purl.org/dc/dcmitype/Image">image</nhdl:type>
        <nhdl:type string="moving image" uri="http://purl.org/dc/dcmitype/MovingImage">moving image</nhdl:type>
        <nhdl:type string="physical object" uri="http://purl.org/dc/dcmitype/PhysicalObject">physical object</nhdl:type>
        <nhdl:type string="physical object" uri="http://purl.org/dc/dcmitype/PhysicalObject">physicalobject</nhdl:type>
        <nhdl:type string="service" uri="http://purl.org/dc/dcmitype/Service">service</nhdl:type>
        <nhdl:type string="software" uri="http://purl.org/dc/dcmitype/Software">software</nhdl:type>
        <nhdl:type string="sound" uri="http://purl.org/dc/dcmitype/Sound">sound</nhdl:type>
        <nhdl:type string="still image" uri="http://purl.org/dc/dcmitype/StillImage">still image</nhdl:type>
        <nhdl:type string="text" uri="http://purl.org/dc/dcmitype/Text">text</nhdl:type>
    </xsl:param>

    <!-- lookup table for frequently-appearing Geonames location URIs -->
    <xsl:param name="geonamesLocation">
      <nhdl:location string="Abbott Brook (Oxford county, Maine : stream)" uri="http://sws.geonames.org/4956405/">Abbott Brook (Oxford county, Maine : stream)</nhdl:location>
      <nhdl:location string="Adams (Berkshire county, Massachusetts : inhabited place)" uri="http://sws.geonames.org/4928733/">Adams (Berkshire county, Massachusetts : inhabited place)</nhdl:location>
      <nhdl:location string="Adams, Mount (Coos county, New Hampshire : peak)" uri="http://sws.geonames.org/5082535/">Adams, Mount (Coos county, New Hampshire : peak)</nhdl:location>
      <nhdl:location string="Akers Pond (Coos county, New Hampshire : lake)" uri="http://sws.geonames.org/5082551/">Akers Pond (Coos county, New Hampshire : lake)</nhdl:location>
      <nhdl:location string="Amherst (Hillsborough county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5082636/">Amherst (Hillsborough county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Androscoggin River (United States, North and Central America : river)" uri="http://sws.geonames.org/4956765/">Androscoggin River (United States, North and Central America : river)</nhdl:location>
      <nhdl:location string="Ashland (Aroostook county, Maine : inhabited place)" uri="http://sws.geonames.org/4956929/">Ashland (Aroostook county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Aziscohos Lake (Oxford County, Maine : Reservoir)" uri="http://sws.geonames.org/4957046/">Aziscohos Lake (Oxford County, Maine : reservoir)</nhdl:location>
      <nhdl:location string="Bald Cap (Coos county, New Hampshire : peak)" uri="http://sws.geonames.org/5082921/">Bald Cap (Coos county, New Hampshire : peak)</nhdl:location>
      <nhdl:location string="Beaver Pond (Franklin county, Maine : lake)" uri="http://sws.geonames.org/4957867/">Beaver Pond (Franklin county, Maine : lake)</nhdl:location>
      <nhdl:location string="Belgrade Lakes (Kennebec county, Maine : inhabited place)" uri="http://sws.geonames.org/4957964/">Belgrade Lakes (Kennebec county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Berlin (Coos County, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5083330/">Berlin (Coos County, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Alexandria (Grafton county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5082573/">Alexandria (Grafton county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Bethlehem (Grafton county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5083374/">Bethlehem (Grafton county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Black Mountain (Coos county, New Hampshire : peak)" uri="http://sws.geonames.org/5083493/">Black Mountain (Coos county, New Hampshire : peak)</nhdl:location>
      <nhdl:location string="Bosebuck Mountain (Oxford county, Maine : peak)" uri="http://sws.geonames.org/4958978/">Bosebuck Mountain (Oxford county, Maine : peak)</nhdl:location>
      <nhdl:location string="Boston (Suffolk county, Massachusetts : inhabited place)" uri="http://sws.geonames.org/4930956/">Boston (Suffolk county, Massachusetts : inhabited place)</nhdl:location>
      <nhdl:location string="Bowman (Coos county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5083703/">Bowman (Coos county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Byron (Oxford county, Maine : inhabited place)" uri="http://sws.geonames.org/4959809/">Byron (Oxford county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Cambridge (Middlesex county, Massachusetts : inhabited place" uri="http://sws.geonames.org/4931972/">Cambridge (Middlesex county, Massachusetts : inhabited place</nhdl:location>
      <nhdl:location string="Camp Wellfleet Dunes (Barnstable county, Massachusetts : dunes)" uri="http://sws.geonames.org/4932158/">Camp Wellfleet Dunes (Barnstable county, Massachusetts : dunes)</nhdl:location>
      <nhdl:location string="Campbell River (Vancouver Island, British Columbia : inhabited place)" uri="http://sws.geonames.org/5914132/">Campbell River (Vancouver Island, British Columbia : inhabited place)</nhdl:location>
      <nhdl:location string="Cape Elizabeth (Cumberland county, Maine : inhabited place)" uri="http://sws.geonames.org/4960078/">Cape Elizabeth (Cumberland county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Cates Hill (Coos county, New Hampshire : peak)" uri="http://sws.geonames.org/5084321/">Cates Hill (Coos county, New Hampshire : peak)</nhdl:location>
      <nhdl:location string="Cedar Pond (Coos county, New Hampshire : lake)" uri="http://sws.geonames.org/5084348/">Cedar Pond (Coos county, New Hampshire : lake)</nhdl:location>
      <nhdl:location string="Chocorua, Mount (Carroll county, New Hampshire : peak)" uri="http://sws.geonames.org/5084573/">Chocorua, Mount (Carroll county, New Hampshire : peak)</nhdl:location>
      <nhdl:location string="Clinton (Oneida county, New York state : inhabited place)" uri="http://sws.geonames.org/5112972/">Clinton (Oneida county, New York state : inhabited place)</nhdl:location>
      <nhdl:location string="Concord (Merrimack county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5084868/">Concord (Merrimack county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Corvallis (Benton county, Oregon : inhabited place)" uri="http://sws.geonames.org/5720727/">Corvallis (Benton county, Oregon : inhabited place)</nhdl:location>
      <nhdl:location string="Cupsuptic Lake (Oxford county, Maine : lake)" uri="http://sws.geonames.org/4961945/">Cupsuptic Lake (Oxford county, Maine : lake)</nhdl:location>
      <nhdl:location string="Danbury (Merrimack county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5085222/">Danbury (Merrimack county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Danville (Caledonia county, Vermont : inhabited place)" uri="http://sws.geonames.org/5235353/">Danville (Caledonia county, Vermont : inhabited place)</nhdl:location>
      <nhdl:location string="Derry (Rockingham county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5085374/">Derry (Rockingham county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Diamond Ridge (Coos county, New Hampshire : ridge)" uri="http://sws.geonames.org/5085410/">Diamond Ridge (Coos county, New Hampshire : ridge)</nhdl:location>
      <nhdl:location string="Dry Mills (Cumberland county, Maine : inhabited place)" uri="http://sws.geonames.org/4962880/">Dry Mills (Cumberland county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Dummer (Coos county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5085591/">Dummer (Coos county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Elkton (Cecil county, Maryland : inhabited place)" uri="http://sws.geonames.org/4354234/">Elkton (Cecil county, Maryland : inhabited place)</nhdl:location>
      <nhdl:location string="Errol (Coos county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5085927/">Errol (Coos county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Fitchburg (Worcester county, Massachusetts : inhabited place)" uri="http://sws.geonames.org/4936812/">Fitchburg (Worcester county, Massachusetts : inhabited place)</nhdl:location>
      <nhdl:location string="Florida (United States, North and Central America : state)" uri="http://sws.geonames.org/4155751/">Florida (United States, North and Central America : state)</nhdl:location>
      <nhdl:location string="Forest, Mount (Coos county, New Hampshire : peak)" uri="http://sws.geonames.org/5086270/">Forest, Mount (Coos county, New Hampshire : peak)</nhdl:location>
      <nhdl:location string="Franklin (Merrimack county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5086344/">Franklin (Merrimack county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Gilead (Oxford county, Maine : inhabited place)" uri="http://sws.geonames.org/4965217/">Gilead (Oxford county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Gorham (Coos County, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5086700/">Gorham (Coos County, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Gorham (Cumberland county, Maine : inhabited place)" uri="http://sws.geonames.org/4965481/">Gorham (Cumberland county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Hampstead (Rockingham county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5087105/">Hampstead (Rockingham county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Holderness (Grafton county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5087552/">Holderness (Grafton county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Holyoke (Hampden County, Massachusetts : inhabited place)" uri="http://sws.geonames.org/4939783/">Holyoke (Hampden County, Massachusetts : inhabited place)</nhdl:location>
      <nhdl:location string="Intervale (Carroll county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5087992/">Intervale (Carroll county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Jefferson (Coos county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5088090/">Jefferson (Coos county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Kennebago (Franklin county, Maine : inhabited place)" uri="http://sws.geonames.org/4968697/">Kennebago (Franklin county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Kennebago Lake (Franklin county, Maine : Lake)" uri="http://sws.geonames.org/4968709/">Kennebago Lake (Franklin county, Maine : Lake)</nhdl:location>
      <nhdl:location string="Kennebago River (Franklin County, Maine : river)" uri="http://sws.geonames.org/4968702/">Kennebago River (Franklin County, Maine : river)</nhdl:location>
      <nhdl:location string="Kennebunk (York county, Maine : inhabited place)" uri="http://sws.geonames.org/4968729/">Kennebunk (York county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Kingston (Washington county, Rhode Island : inhabited place)" uri="http://sws.geonames.org/5223006/">Kingston (Washington county, Rhode Island : inhabited place)</nhdl:location>
      <nhdl:location string="La Tuque (Quebec province, Canada : inhabited place)" uri="http://sws.geonames.org/6050416/">La Tuque (Quebec province, Canada : inhabited place)</nhdl:location>
      <nhdl:location string="Laconia (Belknap county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5088438/">Laconia (Belknap county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Lancaster (Coos county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5088529/">Lancaster (Coos county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Lewiston (Androscoggin county, Maine : inhabited place)" uri="http://sws.geonames.org/4969398/">Lewiston (Androscoggin county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Lincoln Pond (Oxford county, Maine : lake)" uri="http://sws.geonames.org/4969568/">Lincoln Pond (Oxford county, Maine : lake)</nhdl:location>
      <nhdl:location string="Long Pond (Oxford county, Maine : lake)" uri="http://sws.geonames.org/4970424/">Long Pond (Oxford county, Maine : lake)</nhdl:location>
      <nhdl:location string="Lower Richardson Lake (Oxford county, Maine : reservoir)" uri="http://sws.geonames.org/4970762/">Lower Richardson Lake (Oxford county, Maine : reservoir)</nhdl:location>
      <nhdl:location string="Lyman (Grafton county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5089107/">Lyman (Grafton county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Lynchtown (Oxford county, Maine : inhabited place)" uri="http://sws.geonames.org/4970864/">Lynchtown (Oxford county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Magalloway Mountain (Coos county, New Hampshire : peak)" uri="http://sws.geonames.org/5089154/">Magalloway Mountain (Coos county, New Hampshire : peak)</nhdl:location>
      <nhdl:location string="Magalloway River (United States, North and Central America : river)" uri="http://sws.geonames.org/5089155/">Magalloway River (United States, North and Central America : river)</nhdl:location>
      <nhdl:location string="Maidstone (Essex county, Vermont : inhabited place)" uri="http://sws.geonames.org/5238236/">Maidstone (Essex county, Vermont : inhabited place)</nhdl:location>
      <nhdl:location string="Manchester (Hillsborough county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5089178/">Manchester (Hillsborough county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="McCallum (Forrest county, Mississippi : inhabited place)" uri="http://sws.geonames.org/4435288/">McCallum (Forrest county, Mississippi : inhabited place)</nhdl:location>
      <nhdl:location string="Meredith (Belknap county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5089449/">Meredith (Belknap county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Metallak Brook (Oxford county, Maine : stream)" uri="http://sws.geonames.org/4971862/">Metallak Brook (Oxford county, Maine : stream)</nhdl:location>
      <nhdl:location string="Milan (Coos county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5089546/">Milan (Coos county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Milan Hill (Coos county, New Hampshire : peak)" uri="http://sws.geonames.org/5089547/">Milan Hill (Coos county, New Hampshire : peak)</nhdl:location>
      <nhdl:location string="Milford (Hillsborough county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5089578/">Milford (Hillsborough county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Mollidgewock Pond (Oxford county, Maine : lake)" uri="http://sws.geonames.org/5089578/">Mollidgewock Pond (Oxford county, Maine : lake)</nhdl:location>
      <nhdl:location string="Nashua (Hillsborough county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5090046/">Nashua (Hillsborough county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="New Ipswich (Hillsborough county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5090183/">New Ipswich (Hillsborough county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Newport (Sullivan county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5090256/">Newport (Sullivan county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Newell Brook (Coos county, New Hampshire : stream)" uri="http://sws.geonames.org/5090216/">Newell Brook (Coos county, New Hampshire : stream)</nhdl:location>
      <nhdl:location string="Newmarket (Merrimack county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5090245/">Newmarket (Merrimack county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="North Hampton (Rockingham county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5090383/">North Hampton (Rockingham county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="North Stratford (Coos county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5090429/">North Stratford (Coos county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Northfield (Washington county, Vermont : inhabited place)" uri="http://sws.geonames.org/5239281/">Northfield (Washington county, Vermont : inhabited place)</nhdl:location>
      <nhdl:location string="Norton (Essex county, Vermont : inhabited place)" uri="http://sws.geonames.org/5239306/">Norton (Essex county, Vermont : inhabited place)</nhdl:location>
      <nhdl:location string="Norton Pond (Essex county, Vermont : pond)" uri="http://sws.geonames.org/5239313/">Norton Pond (Essex county, Vermont : pond)</nhdl:location>
      <nhdl:location string="Norway (Oxford county, Maine : inhabited place)" uri="http://sws.geonames.org/4973840/">Norway (Oxford county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Old Speck Mountain (Oxford county, Maine : mountain)" uri="http://sws.geonames.org/4974223/">Old Speck Mountain (Oxford county, Maine : mountain)</nhdl:location>
      <nhdl:location string="Oquossoc (Franklin county, Maine : inhabited place)" uri="http://sws.geonames.org/4974276/">Oquossoc (Franklin county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Parmachenee Lake (Oxford county, Maine : lake)" uri="http://sws.geonames.org/4974685/">Parmachenee Lake (Oxford county, Maine : lake)</nhdl:location>
      <nhdl:location string="Pensacola (Escambia county, Florida : inhabited place)" uri="http://sws.geonames.org/4168228/">Pensacola (Escambia county, Florida : inhabited place)</nhdl:location>
      <nhdl:location string="Pittsburg (Coos county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5091247/">Pittsburg (Coos county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Plaistow (Rockingham county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5091273/">Plaistow (Rockingham county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Plymouth (Grafton county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5091310/">Plymouth (Grafton county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Poland Spring (Androscoggin county, Maine : inhabited place)" uri="http://sws.geonames.org/4975614/">Poland Spring (Androscoggin county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Pontook Reservoir (Coos county, New Hampshire : reservoir)" uri="http://sws.geonames.org/5091363/">Pontook Reservoir (Coos county, New Hampshire : reservoir)</nhdl:location>
      <nhdl:location string="Portland (Cumberland County, Maine : inhabited place)" uri="http://sws.geonames.org/4975802/">Portland (Cumberland County, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Presque Isle (Aroostook county, Maine : inhabited place)" uri="http://sws.geonames.org/4975966/">Presque Isle (Aroostook county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Randolph (Coos county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5091604/">Randolph (Coos county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Rump Mountain (Oxford county, Maine : mountain)" uri="http://sws.geonames.org/4977136/">Rump Mountain (Oxford county, Maine : mountain)</nhdl:location>
      <nhdl:location string="Salem (Rockingham county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5092268/">Salem (Rockingham county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Sanbornton (Belknap county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5092338/">Sanbornton (Belknap county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Sandwich (Carroll county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5092370/">Sandwich (Carroll county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Sanmaur (Quebec province, Canada : inhabited place)" uri="http://sws.geonames.org/6141018/">Sanmaur (Quebec province, Canada : inhabited place)</nhdl:location>
      <nhdl:location string="Saratoga Springs (Saratoga county, New York state : inhabited place)" uri="http://sws.geonames.org/5136334/">Saratoga Springs (Saratoga county, New York state : inhabited place)</nhdl:location>
      <nhdl:location string="Shelburne (Coos county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5092608/">Shelburne (Coos county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Stag Hollow Brook (Coos county, New Hampshire : stream)" uri="http://sws.geonames.org/5093074/">Stag Hollow Brook (Coos county, New Hampshire : stream)</nhdl:location>
      <nhdl:location string="Stearns Brook (Coos county, New Hampshire : stream)" uri="http://sws.geonames.org/5093123/">Stearns Brook (Coos county, New Hampshire : stream)</nhdl:location>
      <nhdl:location string="Strafford (Orange county, Vermont : inhabited place)" uri="http://sws.geonames.org/5241636/">Strafford (Orange county, Vermont : inhabited place)</nhdl:location>
      <nhdl:location string="Sturtevant Pond (Oxford county, Maine : lake)" uri="http://sws.geonames.org/4980101/">Sturtevant Pond (Oxford county, Maine : lake)</nhdl:location>
      <nhdl:location string="Success Hill (Coos county, New Hampshire : peak)" uri="http://sws.geonames.org/5093292/">Success Hill (Coos county, New Hampshire : peak)</nhdl:location>
      <nhdl:location string="Success Pond (Coos county, New Hampshire : lake)" uri="http://sws.geonames.org/5093293/">Success Pond (Coos county, New Hampshire : lake)</nhdl:location>
      <nhdl:location string="Success, Mount (Coos county, New Hampshire : peak)" uri="http://sws.geonames.org/5093295/">Success, Mount (Coos county, New Hampshire : peak)</nhdl:location>
      <nhdl:location string="Sugar Hill (Grafton county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5093309/">Sugar Hill (Grafton county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Swift Diamond River (Coos county, New Hampshire : river)" uri="http://sws.geonames.org/5093442/">Swift Diamond River (Coos county, New Hampshire : river)</nhdl:location>
      <nhdl:location string="Taunton (Bristol county, Massachusetts : inhabited place)" uri="http://sws.geonames.org/4952629/">Taunton (Bristol county, Massachuesetts : inhabited place)</nhdl:location>
      <nhdl:location string="Taunton (Bristol county, Massachusetts : inhabited place)" uri="http://sws.geonames.org/4952629/">Taunton (Bristol county, Massachusetts : inhabited place)</nhdl:location>
      <nhdl:location string="Thirteen Mile Woods (Coos county, New Hampshire : woods)" uri="http://sws.geonames.org/5093599/">Thirteen Mile Woods (Coos county, New Hampshire : woods)</nhdl:location>
      <nhdl:location string="Thrasher Peaks (Oxford county, Maine : peak)" uri="http://sws.geonames.org/4980714/">Thrasher Peaks (Oxford county, Maine : peak)</nhdl:location>
      <nhdl:location string="Tinker Brook (Coos county, New Hampshire : stream)" uri="http://sws.geonames.org/5093689/">Tinker Brook (Coos county, New Hampshire : stream)</nhdl:location>
      <nhdl:location string="Tupper Lake (Franklin county, New York state : inhabited place)" uri="http://sws.geonames.org/5141569/">Tupper Lake (Franklin county, New York state : inhabited place)</nhdl:location>
      <nhdl:location string="Waterville Valley (Grafton county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5094304/">Waterville Valley (Grafton county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Washington, Mount (Coos county, New Hampshire : mountain)" uri="http://sws.geonames.org/5094284/">Washington, Mount (Coos county, New Hampshire : mountain)</nhdl:location>
      <nhdl:location string="West Palm Beach (Palm Beach county, Florida : inhabited place)" uri="http://sws.geonames.org/4177887/">West Palm Beach (Palm Beach county, Florida : inhabited place)</nhdl:location>
      <nhdl:location string="Westchester (New York state, United States : county)" uri="http://sws.geonames.org/5144050/">Westchester (New York state, United States : county)</nhdl:location>
      <nhdl:location string="Whitefield (Coos county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5094647/">Whitefield (Coos county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Wilsons Mills (Oxford County, Maine : inhabited place)" uri="http://sws.geonames.org/4983281/">Wilsons Mills (Oxford County, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Winnipesaukee, Lake (New Hampshire, United States : lake)" uri="http://sws.geonames.org/5094864/">Winnipesaukee, Lake (New Hampshire, United States : lake)</nhdl:location>
      <nhdl:location string="Wilton (Hillsborough county, New Hampshire : inhabited place)" uri="http://sws.geonames.org/5094802/">Wilton (Hillsborough county, New Hampshire : inhabited place)</nhdl:location>
      <nhdl:location string="Turner (Androscoggin county, Maine : inhabited place)" uri="http://sws.geonames.org/4981250/">Turner (Androscoggin county, Maine : inhabited place)</nhdl:location>
      <nhdl:location string="Umbagog Lake (United States, North and Central America : lake)" uri="http://sws.geonames.org/5093916/">Umbagog Lake (United States, North and Central America : lake)</nhdl:location>
      <nhdl:location string="Upper Richardson Lake (Oxford county, Maine : lake)" uri="http://sws.geonames.org/4981659/">Upper Richardson Lake (Oxford county, Maine : lake)</nhdl:location>
      <nhdl:location string="Victory (Essex county, Vermont : inhabited place)" uri="http://sws.geonames.org/5242301/">Victory (Essex county, Vermont : inhabited place)</nhdl:location>
    </xsl:param>

    <!-- lookup table for recommended Getty AAT subtype terms/URIs -->
    <xsl:param name="gettySubtype">
        <nhdl:type string="advertisements" uri="http://vocab.getty.edu/aat/300193993">advertisements</nhdl:type>
        <nhdl:type string="architectural documents" uri="http://vocab.getty.edu/aat/300343615">architectural documents</nhdl:type>
        <nhdl:type string="books" uri="http://vocab.getty.edu/aat/300028051">books</nhdl:type>
        <nhdl:type string="broadsides (notices)" uri="http://vocab.getty.edu/aat/300026739">broadsides</nhdl:type>
        <nhdl:type string="business records" uri="http://vocab.getty.edu/aat/300141693">business records</nhdl:type>
        <nhdl:type string="cartographic materials" uri="http://vocab.getty.edu/aat/300028052">cartographic materials</nhdl:type>
        <nhdl:type string="census records" uri="http://vocab.getty.edu/aat/300026832">census records</nhdl:type>
        <nhdl:type string="ceramic ware (visual works)" uri="http://vocab.getty.edu/aat/300386879">certamic ware</nhdl:type>
        <nhdl:type string="comics (documents)" uri="http://vocab.getty.edu/aat/300015635">comics</nhdl:type>
        <nhdl:type string="correspondence" uri="http://vocab.getty.edu/aat/300026877">correspondence</nhdl:type>
        <nhdl:type string="costume (mode of fashion)" uri="http://vocab.getty.edu/aat/300209275">costume</nhdl:type>
        <nhdl:type string="cultural artifacts" uri="http://vocab.getty.edu/aat/300265421">cultural artifacts</nhdl:type>
        <nhdl:type string="decorative arts" uri="http://vocab.getty.edu/aat/300054168">decorative arts</nhdl:type>
        <nhdl:type string="drawings (visual works)" uri="http://vocab.getty.edu/aat/300033973">drawings</nhdl:type>
        <nhdl:type string="furniture" uri="http://vocab.getty.edu/aat/300037680">furniture</nhdl:type>
        <nhdl:type string="genealogies (histories)" uri="http://vocab.getty.edu/aat/300027015">genealogies</nhdl:type>
        <nhdl:type string="government records" uri="http://vocab.getty.edu/aat/300027777">government records</nhdl:type>
        <nhdl:type string="graphic arts" uri="http://vocab.getty.edu/aat/300264849">graphic arts</nhdl:type>
        <nhdl:type string="interviews" uri="http://vocab.getty.edu/aat/300026392">interviews</nhdl:type>
        <nhdl:type string="jewelry" uri="http://vocab.getty.edu/aat/300209286">jewelry</nhdl:type>
        <nhdl:type string="motion pictures (visual works)" uri="http://vocab.getty.edu/aat/300136900">motion pictures</nhdl:type>
        <nhdl:type string="natural history specimens" uri="http://vocab.getty.edu/aat/300379591">natural history specimens</nhdl:type>
        <nhdl:type string="newspapers" uri="http://vocab.getty.edu/aat/300026656">newspapers</nhdl:type>
        <nhdl:type string="oral histories (document genre)" uri="http://vocab.getty.edu/aat/300202595">oral histories</nhdl:type>
        <nhdl:type string="painting (visual works)" uri="http://vocab.getty.edu/aat/300033618">paiting</nhdl:type>
        <nhdl:type string="pamphlets" uri="http://vocab.getty.edu/aat/300220572">pamphlets</nhdl:type>
        <nhdl:type string="performances (creative events)" uri="http://vocab.getty.edu/aat/300069200">performances</nhdl:type>
        <nhdl:type string="periodicals" uri="http://vocab.getty.edu/aat/300026657">periodicals</nhdl:type>
        <nhdl:type string="photographs" uri="http://vocab.getty.edu/aat/300046300">photographs</nhdl:type>
        <nhdl:type string="postcards" uri="http://vocab.getty.edu/aat/300026816">postcards</nhdl:type>
        <nhdl:type string="posters" uri="http://vocab.getty.edu/aat/300027221">posters</nhdl:type>
        <nhdl:type string="prints (visual works)" uri="http://vocab.getty.edu/aat/300041273">color prints</nhdl:type>
        <nhdl:type string="prints (visual works)" uri="http://vocab.getty.edu/aat/300041273">prints</nhdl:type>
        <nhdl:type string="reference sources" uri="http://vocab.getty.edu/aat/300163404">reference sources</nhdl:type>
        <nhdl:type string="sculpture (visual works)" uri="http://vocab.getty.edu/aat/300047090">sculpture</nhdl:type>
        <nhdl:type string="sermons" uri="http://vocab.getty.edu/aat/300026669">sermons</nhdl:type>
        <nhdl:type string="sheet music" uri="http://vocab.getty.edu/aat/300026430">sheet music</nhdl:type>
        <nhdl:type string="sound recording" uri="http://vocab.getty.edu/aat/300028633">sound recording</nhdl:type>
        <nhdl:type string="textiles (visual works)" uri="http://vocab.getty.edu/aat/300014063">textiles</nhdl:type>
        <nhdl:type string="theses" uri="http://vocab.getty.edu/aat/300028028">theses</nhdl:type>
        <nhdl:type string="tools" uri="http://vocab.getty.edu/aat/300024841">tools</nhdl:type>
        <nhdl:type string="weapons" uri="http://vocab.getty.edu/aat/300036926">weapons</nhdl:type>
        <nhdl:type string="yearbooks" uri="http://vocab.getty.edu/aat/300026646">yearbooks</nhdl:type>
    </xsl:param>

    <!-- lookup table for recommended Lexvo Languages terms/URIs -->
    <xsl:param name="lexvoLang">
      <nhdl:language string="aar" uri="http://lexvo.org/id/iso639-3/aar">aar</nhdl:language>
      <nhdl:language string="abk" uri="http://lexvo.org/id/iso639-3/abk">abk</nhdl:language>
      <nhdl:language string="ace" uri="http://lexvo.org/id/iso639-3/ace">ace</nhdl:language>``
      <nhdl:language string="ach" uri="http://lexvo.org/id/iso639-3/ach">ach</nhdl:language>
      <nhdl:language string="ada" uri="http://lexvo.org/id/iso639-3/ada">ada</nhdl:language>
      <nhdl:language string="ady" uri="http://lexvo.org/id/iso639-3/ady">ady</nhdl:language>
      <nhdl:language string="afa" uri="http://lexvo.org/id/iso639-5/afa">afa</nhdl:language>
      <nhdl:language string="afh" uri="http://lexvo.org/id/iso639-3/afh">afh</nhdl:language>
      <nhdl:language string="afr" uri="http://lexvo.org/id/iso639-3/afr">afr</nhdl:language>
      <nhdl:language string="ain" uri="http://lexvo.org/id/iso639-3/ain">ain</nhdl:language>
      <nhdl:language string="aka" uri="http://lexvo.org/id/iso639-3/aka">aka</nhdl:language>
      <nhdl:language string="akk" uri="http://lexvo.org/id/iso639-3/akk">akk</nhdl:language>
      <nhdl:language string="alb" uri="http://lexvo.org/id/iso639-3/sqi">alb</nhdl:language>
      <nhdl:language string="ale" uri="http://lexvo.org/id/iso639-3/ale">ale</nhdl:language>
      <nhdl:language string="alg" uri="http://lexvo.org/id/iso639-5/alg">alg</nhdl:language>
      <nhdl:language string="alt" uri="http://lexvo.org/id/iso639-3/alt">alt</nhdl:language>
      <nhdl:language string="amh" uri="http://lexvo.org/id/iso639-3/amh">amh</nhdl:language>
      <nhdl:language string="ang" uri="http://lexvo.org/id/iso639-3/ang">ang</nhdl:language>
      <nhdl:language string="anp" uri="http://lexvo.org/id/iso639-3/anp">anp</nhdl:language>
      <nhdl:language string="apa" uri="http://lexvo.org/id/iso639-5/apa">apa</nhdl:language>
      <nhdl:language string="ara" uri="http://lexvo.org/id/iso639-3/ara">ara</nhdl:language>
      <nhdl:language string="arc" uri="http://lexvo.org/id/iso639-3/arc">arc</nhdl:language>
      <nhdl:language string="arg" uri="http://lexvo.org/id/iso639-3/arg">arg</nhdl:language>
      <nhdl:language string="arm" uri="http://lexvo.org/id/iso639-3/hye">arm</nhdl:language>
      <nhdl:language string="arn" uri="http://lexvo.org/id/iso639-3/arn">arn</nhdl:language>
      <nhdl:language string="arp" uri="http://lexvo.org/id/iso639-3/arp">arp</nhdl:language>
      <nhdl:language string="art" uri="http://lexvo.org/id/iso639-5/art">art</nhdl:language>
      <nhdl:language string="arw" uri="http://lexvo.org/id/iso639-3/arw">arw</nhdl:language>
      <nhdl:language string="asm" uri="http://lexvo.org/id/iso639-3/asm">asm</nhdl:language>
      <nhdl:language string="ast" uri="http://lexvo.org/id/iso639-3/ast">ast</nhdl:language>
      <nhdl:language string="ath" uri="http://lexvo.org/id/iso639-5/ath">ath</nhdl:language>
      <nhdl:language string="aus" uri="http://lexvo.org/id/iso639-5/aus">aus</nhdl:language>
      <nhdl:language string="ava" uri="http://lexvo.org/id/iso639-3/ava">ava</nhdl:language>
      <nhdl:language string="ave" uri="http://lexvo.org/id/iso639-3/ave">ave</nhdl:language>
      <nhdl:language string="awa" uri="http://lexvo.org/id/iso639-3/awa">awa</nhdl:language>
      <nhdl:language string="aym" uri="http://lexvo.org/id/iso639-3/aym">aym</nhdl:language>
      <nhdl:language string="aze" uri="http://lexvo.org/id/iso639-3/aze">aze</nhdl:language>
      <nhdl:language string="bad" uri="http://lexvo.org/id/iso639-5/bad">bad</nhdl:language>
      <nhdl:language string="bai" uri="http://lexvo.org/id/iso639-5/bai">bai</nhdl:language>
      <nhdl:language string="bak" uri="http://lexvo.org/id/iso639-3/bak">bak</nhdl:language>
      <nhdl:language string="bal" uri="http://lexvo.org/id/iso639-3/bal">bal</nhdl:language>
      <nhdl:language string="bam" uri="http://lexvo.org/id/iso639-3/bam">bam</nhdl:language>
      <nhdl:language string="ban" uri="http://lexvo.org/id/iso639-3/ban">ban</nhdl:language>
      <nhdl:language string="baq" uri="http://lexvo.org/id/iso639-3/eus">baq</nhdl:language>
      <nhdl:language string="bas" uri="http://lexvo.org/id/iso639-3/bas">bas</nhdl:language>
      <nhdl:language string="bat" uri="http://lexvo.org/id/iso639-5/bat">bat</nhdl:language>
      <nhdl:language string="bej" uri="http://lexvo.org/id/iso639-3/bej">bej</nhdl:language>
      <nhdl:language string="bel" uri="http://lexvo.org/id/iso639-3/bel">bel</nhdl:language>
      <nhdl:language string="bem" uri="http://lexvo.org/id/iso639-3/bem">bem</nhdl:language>
      <nhdl:language string="ben" uri="http://lexvo.org/id/iso639-3/ben">ben</nhdl:language>
      <nhdl:language string="ber" uri="http://lexvo.org/id/iso639-5/ber">ber</nhdl:language>
      <nhdl:language string="bho" uri="http://lexvo.org/id/iso639-3/bho">bho</nhdl:language>
      <nhdl:language string="bik" uri="http://lexvo.org/id/iso639-3/bik">bik</nhdl:language>
      <nhdl:language string="bin" uri="http://lexvo.org/id/iso639-3/bin">bin</nhdl:language>
      <nhdl:language string="bis" uri="http://lexvo.org/id/iso639-3/bis">bis</nhdl:language>
      <nhdl:language string="bla" uri="http://lexvo.org/id/iso639-3/bla">bla</nhdl:language>
      <nhdl:language string="bnt" uri="http://lexvo.org/id/iso639-5/bnt">bnt</nhdl:language>
      <nhdl:language string="bod" uri="http://lexvo.org/id/iso639-3/bod">bod</nhdl:language>
      <nhdl:language string="bos" uri="http://lexvo.org/id/iso639-3/bos">bos</nhdl:language>
      <nhdl:language string="bra" uri="http://lexvo.org/id/iso639-3/bra">bra</nhdl:language>
      <nhdl:language string="bre" uri="http://lexvo.org/id/iso639-3/bre">bre</nhdl:language>
      <nhdl:language string="btk" uri="http://lexvo.org/id/iso639-5/btk">btk</nhdl:language>
      <nhdl:language string="bua" uri="http://lexvo.org/id/iso639-3/bua">bua</nhdl:language>
      <nhdl:language string="bug" uri="http://lexvo.org/id/iso639-3/bug">bug</nhdl:language>
      <nhdl:language string="bul" uri="http://lexvo.org/id/iso639-3/bul">bul</nhdl:language>
      <nhdl:language string="bur" uri="http://lexvo.org/id/iso639-3/mya">bur</nhdl:language>
      <nhdl:language string="byn" uri="http://lexvo.org/id/iso639-3/byn">byn</nhdl:language>
      <nhdl:language string="cad" uri="http://lexvo.org/id/iso639-3/cad">cad</nhdl:language>
      <nhdl:language string="cai" uri="http://lexvo.org/id/iso639-5/cai">cai</nhdl:language>
      <nhdl:language string="car" uri="http://lexvo.org/id/iso639-3/car">car</nhdl:language>
      <nhdl:language string="cat" uri="http://lexvo.org/id/iso639-3/cat">cat</nhdl:language>
      <nhdl:language string="cau" uri="http://lexvo.org/id/iso639-5/cau">cau</nhdl:language>
      <nhdl:language string="ceb" uri="http://lexvo.org/id/iso639-3/ceb">ceb</nhdl:language>
      <nhdl:language string="cel" uri="http://lexvo.org/id/iso639-5/cel">cel</nhdl:language>
      <nhdl:language string="ces" uri="http://lexvo.org/id/iso639-3/ces">ces</nhdl:language>
      <nhdl:language string="cha" uri="http://lexvo.org/id/iso639-3/cha">cha</nhdl:language>
      <nhdl:language string="chb" uri="http://lexvo.org/id/iso639-3/chb">chb</nhdl:language>
      <nhdl:language string="che" uri="http://lexvo.org/id/iso639-3/che">che</nhdl:language>
      <nhdl:language string="chg" uri="http://lexvo.org/id/iso639-3/chg">chg</nhdl:language>
      <nhdl:language string="chi" uri="http://lexvo.org/id/iso639-3/zho">chi</nhdl:language>
      <nhdl:language string="chk" uri="http://lexvo.org/id/iso639-3/chk">chk</nhdl:language>
      <nhdl:language string="chm" uri="http://lexvo.org/id/iso639-3/chm">chm</nhdl:language>
      <nhdl:language string="chn" uri="http://lexvo.org/id/iso639-3/chn">chn</nhdl:language>
      <nhdl:language string="cho" uri="http://lexvo.org/id/iso639-3/cho">cho</nhdl:language>
      <nhdl:language string="chp" uri="http://lexvo.org/id/iso639-3/chp">chp</nhdl:language>
      <nhdl:language string="chr" uri="http://lexvo.org/id/iso639-3/chr">chr</nhdl:language>
      <nhdl:language string="chu" uri="http://lexvo.org/id/iso639-3/chu">chu</nhdl:language>
      <nhdl:language string="chv" uri="http://lexvo.org/id/iso639-3/chv">chv</nhdl:language>
      <nhdl:language string="chy" uri="http://lexvo.org/id/iso639-3/chy">chy</nhdl:language>
      <nhdl:language string="cmc" uri="http://lexvo.org/id/iso639-5/cmc">cmc</nhdl:language>
      <nhdl:language string="cop" uri="http://lexvo.org/id/iso639-3/cop">cop</nhdl:language>
      <nhdl:language string="cor" uri="http://lexvo.org/id/iso639-3/cor">cor</nhdl:language>
      <nhdl:language string="cos" uri="http://lexvo.org/id/iso639-3/cos">cos</nhdl:language>
      <nhdl:language string="cpe" uri="http://lexvo.org/id/iso639-5/cpe">cpe</nhdl:language>
      <nhdl:language string="cpf" uri="http://lexvo.org/id/iso639-5/cpf">cpf</nhdl:language>
      <nhdl:language string="cpp" uri="http://lexvo.org/id/iso639-5/cpp">cpp</nhdl:language>
      <nhdl:language string="cre" uri="http://lexvo.org/id/iso639-3/cre">cre</nhdl:language>
      <nhdl:language string="crh" uri="http://lexvo.org/id/iso639-3/crh">crh</nhdl:language>
      <nhdl:language string="crp" uri="http://lexvo.org/id/iso639-5/crp">crp</nhdl:language>
      <nhdl:language string="csb" uri="http://lexvo.org/id/iso639-3/csb">csb</nhdl:language>
      <nhdl:language string="cus" uri="http://lexvo.org/id/iso639-5/cus">cus</nhdl:language>
      <nhdl:language string="cym" uri="http://lexvo.org/id/iso639-3/cym">cym</nhdl:language>
      <nhdl:language string="cze" uri="http://lexvo.org/id/iso639-3/ces">cze</nhdl:language>
      <nhdl:language string="dak" uri="http://lexvo.org/id/iso639-3/dak">dak</nhdl:language>
      <nhdl:language string="dan" uri="http://lexvo.org/id/iso639-3/dan">dan</nhdl:language>
      <nhdl:language string="dar" uri="http://lexvo.org/id/iso639-3/dar">dar</nhdl:language>
      <nhdl:language string="day" uri="http://lexvo.org/id/iso639-5/day">day</nhdl:language>
      <nhdl:language string="del" uri="http://lexvo.org/id/iso639-3/del">del</nhdl:language>
      <nhdl:language string="den" uri="http://lexvo.org/id/iso639-3/den">den</nhdl:language>
      <nhdl:language string="deu" uri="http://lexvo.org/id/iso639-3/deu">deu</nhdl:language>
      <nhdl:language string="dgr" uri="http://lexvo.org/id/iso639-3/dgr">dgr</nhdl:language>
      <nhdl:language string="din" uri="http://lexvo.org/id/iso639-3/din">din</nhdl:language>
      <nhdl:language string="div" uri="http://lexvo.org/id/iso639-3/div">div</nhdl:language>
      <nhdl:language string="doi" uri="http://lexvo.org/id/iso639-3/doi">doi</nhdl:language>
      <nhdl:language string="dra" uri="http://lexvo.org/id/iso639-5/dra">dra</nhdl:language>
      <nhdl:language string="dsb" uri="http://lexvo.org/id/iso639-3/dsb">dsb</nhdl:language>
      <nhdl:language string="dua" uri="http://lexvo.org/id/iso639-3/dua">dua</nhdl:language>
      <nhdl:language string="dum" uri="http://lexvo.org/id/iso639-3/dum">dum</nhdl:language>
      <nhdl:language string="dut" uri="http://lexvo.org/id/iso639-3/nld">dut</nhdl:language>
      <nhdl:language string="dyu" uri="http://lexvo.org/id/iso639-3/dyu">dyu</nhdl:language>
      <nhdl:language string="dzo" uri="http://lexvo.org/id/iso639-3/dzo">dzo</nhdl:language>
      <nhdl:language string="efi" uri="http://lexvo.org/id/iso639-3/efi">efi</nhdl:language>
      <nhdl:language string="egy" uri="http://lexvo.org/id/iso639-3/egy">egy</nhdl:language>
      <nhdl:language string="eka" uri="http://lexvo.org/id/iso639-3/eka">eka</nhdl:language>
      <nhdl:language string="ell" uri="http://lexvo.org/id/iso639-3/ell">ell</nhdl:language>
      <nhdl:language string="elx" uri="http://lexvo.org/id/iso639-3/elx">elx</nhdl:language>
      <nhdl:language string="eng" uri="http://lexvo.org/id/iso639-3/eng">eng</nhdl:language>
      <nhdl:language string="enm" uri="http://lexvo.org/id/iso639-3/enm">enm</nhdl:language>
      <nhdl:language string="epo" uri="http://lexvo.org/id/iso639-3/epo">epo</nhdl:language>
      <nhdl:language string="est" uri="http://lexvo.org/id/iso639-3/est">est</nhdl:language>
      <nhdl:language string="eus" uri="http://lexvo.org/id/iso639-3/eus">eus</nhdl:language>
      <nhdl:language string="ewe" uri="http://lexvo.org/id/iso639-3/ewe">ewe</nhdl:language>
      <nhdl:language string="ewo" uri="http://lexvo.org/id/iso639-3/ewo">ewo</nhdl:language>
      <nhdl:language string="fan" uri="http://lexvo.org/id/iso639-3/fan">fan</nhdl:language>
      <nhdl:language string="fao" uri="http://lexvo.org/id/iso639-3/fao">fao</nhdl:language>
      <nhdl:language string="fas" uri="http://lexvo.org/id/iso639-3/fas">fas</nhdl:language>
      <nhdl:language string="fat" uri="http://lexvo.org/id/iso639-3/fat">fat</nhdl:language>
      <nhdl:language string="fij" uri="http://lexvo.org/id/iso639-3/fij">fij</nhdl:language>
      <nhdl:language string="fil" uri="http://lexvo.org/id/iso639-3/fil">fil</nhdl:language>
      <nhdl:language string="fin" uri="http://lexvo.org/id/iso639-3/fin">fin</nhdl:language>
      <nhdl:language string="fiu" uri="http://lexvo.org/id/iso639-5/fiu">fiu</nhdl:language>
      <nhdl:language string="fon" uri="http://lexvo.org/id/iso639-3/fon">fon</nhdl:language>
      <nhdl:language string="fra" uri="http://lexvo.org/id/iso639-3/fra">fra</nhdl:language>
      <nhdl:language string="fre" uri="http://lexvo.org/id/iso639-3/fra">fre</nhdl:language>
      <nhdl:language string="frm" uri="http://lexvo.org/id/iso639-3/frm">frm</nhdl:language>
      <nhdl:language string="fro" uri="http://lexvo.org/id/iso639-3/fro">fro</nhdl:language>
      <nhdl:language string="frr" uri="http://lexvo.org/id/iso639-3/frr">frr</nhdl:language>
      <nhdl:language string="frs" uri="http://lexvo.org/id/iso639-3/frs">frs</nhdl:language>
      <nhdl:language string="fry" uri="http://lexvo.org/id/iso639-3/fry">fry</nhdl:language>
      <nhdl:language string="ful" uri="http://lexvo.org/id/iso639-3/ful">ful</nhdl:language>
      <nhdl:language string="fur" uri="http://lexvo.org/id/iso639-3/fur">fur</nhdl:language>
      <nhdl:language string="gaa" uri="http://lexvo.org/id/iso639-3/gaa">gaa</nhdl:language>
      <nhdl:language string="gay" uri="http://lexvo.org/id/iso639-3/gay">gay</nhdl:language>
      <nhdl:language string="gba" uri="http://lexvo.org/id/iso639-3/gba">gba</nhdl:language>
      <nhdl:language string="gem" uri="http://lexvo.org/id/iso639-5/gem">gem</nhdl:language>
      <nhdl:language string="geo" uri="http://lexvo.org/id/iso639-3/kat">geo</nhdl:language>
      <nhdl:language string="ger" uri="http://lexvo.org/id/iso639-3/deu">ger</nhdl:language>
      <nhdl:language string="gez" uri="http://lexvo.org/id/iso639-3/gez">gez</nhdl:language>
      <nhdl:language string="gil" uri="http://lexvo.org/id/iso639-3/gil">gil</nhdl:language>
      <nhdl:language string="gla" uri="http://lexvo.org/id/iso639-3/gla">gla</nhdl:language>
      <nhdl:language string="gle" uri="http://lexvo.org/id/iso639-3/gle">gle</nhdl:language>
      <nhdl:language string="glg" uri="http://lexvo.org/id/iso639-3/glg">glg</nhdl:language>
      <nhdl:language string="glv" uri="http://lexvo.org/id/iso639-3/glv">glv</nhdl:language>
      <nhdl:language string="gmh" uri="http://lexvo.org/id/iso639-3/gmh">gmh</nhdl:language>
      <nhdl:language string="goh" uri="http://lexvo.org/id/iso639-3/goh">goh</nhdl:language>
      <nhdl:language string="gon" uri="http://lexvo.org/id/iso639-3/gon">gon</nhdl:language>
      <nhdl:language string="gor" uri="http://lexvo.org/id/iso639-3/gor">gor</nhdl:language>
      <nhdl:language string="got" uri="http://lexvo.org/id/iso639-3/got">got</nhdl:language>
      <nhdl:language string="grb" uri="http://lexvo.org/id/iso639-3/grb">grb</nhdl:language>
      <nhdl:language string="grc" uri="http://lexvo.org/id/iso639-3/grc">grc</nhdl:language>
      <nhdl:language string="gre" uri="http://lexvo.org/id/iso639-3/ell">gre</nhdl:language>
      <nhdl:language string="grn" uri="http://lexvo.org/id/iso639-3/grn">grn</nhdl:language>
      <nhdl:language string="gsw" uri="http://lexvo.org/id/iso639-3/gsw">gsw</nhdl:language>
      <nhdl:language string="guj" uri="http://lexvo.org/id/iso639-3/guj">guj</nhdl:language>
      <nhdl:language string="gwi" uri="http://lexvo.org/id/iso639-3/gwi">gwi</nhdl:language>
      <nhdl:language string="hai" uri="http://lexvo.org/id/iso639-3/hai">hai</nhdl:language>
      <nhdl:language string="hat" uri="http://lexvo.org/id/iso639-3/hat">hat</nhdl:language>
      <nhdl:language string="hau" uri="http://lexvo.org/id/iso639-3/hau">hau</nhdl:language>
      <nhdl:language string="haw" uri="http://lexvo.org/id/iso639-3/haw">haw</nhdl:language>
      <nhdl:language string="heb" uri="http://lexvo.org/id/iso639-3/heb">heb</nhdl:language>
      <nhdl:language string="her" uri="http://lexvo.org/id/iso639-3/her">her</nhdl:language>
      <nhdl:language string="hil" uri="http://lexvo.org/id/iso639-3/hil">hil</nhdl:language>
      <nhdl:language string="hin" uri="http://lexvo.org/id/iso639-3/hin">hin</nhdl:language>
      <nhdl:language string="hit" uri="http://lexvo.org/id/iso639-3/hit">hit</nhdl:language>
      <nhdl:language string="hmn" uri="http://lexvo.org/id/iso639-3/hmn">hmn</nhdl:language>
      <nhdl:language string="hmo" uri="http://lexvo.org/id/iso639-3/hmo">hmo</nhdl:language>
      <nhdl:language string="hrv" uri="http://lexvo.org/id/iso639-3/hrv">hrv</nhdl:language>
      <nhdl:language string="hsb" uri="http://lexvo.org/id/iso639-3/hsb">hsb</nhdl:language>
      <nhdl:language string="hun" uri="http://lexvo.org/id/iso639-3/hun">hun</nhdl:language>
      <nhdl:language string="hup" uri="http://lexvo.org/id/iso639-3/hup">hup</nhdl:language>
      <nhdl:language string="hye" uri="http://lexvo.org/id/iso639-3/hye">hye</nhdl:language>
      <nhdl:language string="iba" uri="http://lexvo.org/id/iso639-3/iba">iba</nhdl:language>
      <nhdl:language string="ibo" uri="http://lexvo.org/id/iso639-3/ibo">ibo</nhdl:language>
      <nhdl:language string="ice" uri="http://lexvo.org/id/iso639-3/isl">ice</nhdl:language>
      <nhdl:language string="ido" uri="http://lexvo.org/id/iso639-3/ido">ido</nhdl:language>
      <nhdl:language string="iii" uri="http://lexvo.org/id/iso639-3/iii">iii</nhdl:language>
      <nhdl:language string="ijo" uri="http://lexvo.org/id/iso639-5/ijo">ijo</nhdl:language>
      <nhdl:language string="iku" uri="http://lexvo.org/id/iso639-3/iku">iku</nhdl:language>
      <nhdl:language string="ile" uri="http://lexvo.org/id/iso639-3/ile">ile</nhdl:language>
      <nhdl:language string="ilo" uri="http://lexvo.org/id/iso639-3/ilo">ilo</nhdl:language>
      <nhdl:language string="ina" uri="http://lexvo.org/id/iso639-3/ina">ina</nhdl:language>
      <nhdl:language string="inc" uri="http://lexvo.org/id/iso639-5/inc">inc</nhdl:language>
      <nhdl:language string="ind" uri="http://lexvo.org/id/iso639-3/ind">ind</nhdl:language>
      <nhdl:language string="ine" uri="http://lexvo.org/id/iso639-5/ine">ine</nhdl:language>
      <nhdl:language string="inh" uri="http://lexvo.org/id/iso639-3/inh">inh</nhdl:language>
      <nhdl:language string="ipk" uri="http://lexvo.org/id/iso639-3/ipk">ipk</nhdl:language>
      <nhdl:language string="ira" uri="http://lexvo.org/id/iso639-5/ira">ira</nhdl:language>
      <nhdl:language string="iro" uri="http://lexvo.org/id/iso639-5/iro">iro</nhdl:language>
      <nhdl:language string="isl" uri="http://lexvo.org/id/iso639-3/isl">isl</nhdl:language>
      <nhdl:language string="ita" uri="http://lexvo.org/id/iso639-3/ita">ita</nhdl:language>
      <nhdl:language string="jav" uri="http://lexvo.org/id/iso639-3/jav">jav</nhdl:language>
      <nhdl:language string="jbo" uri="http://lexvo.org/id/iso639-3/jbo">jbo</nhdl:language>
      <nhdl:language string="jpn" uri="http://lexvo.org/id/iso639-3/jpn">jpn</nhdl:language>
      <nhdl:language string="jpr" uri="http://lexvo.org/id/iso639-3/jpr">jpr</nhdl:language>
      <nhdl:language string="jrb" uri="http://lexvo.org/id/iso639-3/jrb">jrb</nhdl:language>
      <nhdl:language string="kaa" uri="http://lexvo.org/id/iso639-3/kaa">kaa</nhdl:language>
      <nhdl:language string="kab" uri="http://lexvo.org/id/iso639-3/kab">kab</nhdl:language>
      <nhdl:language string="kac" uri="http://lexvo.org/id/iso639-3/kac">kac</nhdl:language>
      <nhdl:language string="kal" uri="http://lexvo.org/id/iso639-3/kal">kal</nhdl:language>
      <nhdl:language string="kam" uri="http://lexvo.org/id/iso639-3/kam">kam</nhdl:language>
      <nhdl:language string="kan" uri="http://lexvo.org/id/iso639-3/kan">kan</nhdl:language>
      <nhdl:language string="kar" uri="http://lexvo.org/id/iso639-5/kar">kar</nhdl:language>
      <nhdl:language string="kas" uri="http://lexvo.org/id/iso639-3/kas">kas</nhdl:language>
      <nhdl:language string="kat" uri="http://lexvo.org/id/iso639-3/kat">kat</nhdl:language>
      <nhdl:language string="kau" uri="http://lexvo.org/id/iso639-3/kau">kau</nhdl:language>
      <nhdl:language string="kaw" uri="http://lexvo.org/id/iso639-3/kaw">kaw</nhdl:language>
      <nhdl:language string="kaz" uri="http://lexvo.org/id/iso639-3/kaz">kaz</nhdl:language>
      <nhdl:language string="kbd" uri="http://lexvo.org/id/iso639-3/kbd">kbd</nhdl:language>
      <nhdl:language string="kha" uri="http://lexvo.org/id/iso639-3/kha">kha</nhdl:language>
      <nhdl:language string="khi" uri="http://lexvo.org/id/iso639-5/khi">khi</nhdl:language>
      <nhdl:language string="khm" uri="http://lexvo.org/id/iso639-3/khm">khm</nhdl:language>
      <nhdl:language string="kho" uri="http://lexvo.org/id/iso639-3/kho">kho</nhdl:language>
      <nhdl:language string="kik" uri="http://lexvo.org/id/iso639-3/kik">kik</nhdl:language>
      <nhdl:language string="kin" uri="http://lexvo.org/id/iso639-3/kin">kin</nhdl:language>
      <nhdl:language string="kir" uri="http://lexvo.org/id/iso639-3/kir">kir</nhdl:language>
      <nhdl:language string="kmb" uri="http://lexvo.org/id/iso639-3/kmb">kmb</nhdl:language>
      <nhdl:language string="kok" uri="http://lexvo.org/id/iso639-3/kok">kok</nhdl:language>
      <nhdl:language string="kom" uri="http://lexvo.org/id/iso639-3/kom">kom</nhdl:language>
      <nhdl:language string="kon" uri="http://lexvo.org/id/iso639-3/kon">kon</nhdl:language>
      <nhdl:language string="kor" uri="http://lexvo.org/id/iso639-3/kor">kor</nhdl:language>
      <nhdl:language string="kos" uri="http://lexvo.org/id/iso639-3/kos">kos</nhdl:language>
      <nhdl:language string="kpe" uri="http://lexvo.org/id/iso639-3/kpe">kpe</nhdl:language>
      <nhdl:language string="krc" uri="http://lexvo.org/id/iso639-3/krc">krc</nhdl:language>
      <nhdl:language string="krl" uri="http://lexvo.org/id/iso639-3/krl">krl</nhdl:language>
      <nhdl:language string="kro" uri="http://lexvo.org/id/iso639-5/kro">kro</nhdl:language>
      <nhdl:language string="kru" uri="http://lexvo.org/id/iso639-3/kru">kru</nhdl:language>
      <nhdl:language string="kua" uri="http://lexvo.org/id/iso639-3/kua">kua</nhdl:language>
      <nhdl:language string="kum" uri="http://lexvo.org/id/iso639-3/kum">kum</nhdl:language>
      <nhdl:language string="kur" uri="http://lexvo.org/id/iso639-3/kur">kur</nhdl:language>
      <nhdl:language string="kut" uri="http://lexvo.org/id/iso639-3/kut">kut</nhdl:language>
      <nhdl:language string="lad" uri="http://lexvo.org/id/iso639-3/lad">lad</nhdl:language>
      <nhdl:language string="lah" uri="http://lexvo.org/id/iso639-3/lah">lah</nhdl:language>
      <nhdl:language string="lam" uri="http://lexvo.org/id/iso639-3/lam">lam</nhdl:language>
      <nhdl:language string="lao" uri="http://lexvo.org/id/iso639-3/lao">lao</nhdl:language>
      <nhdl:language string="lat" uri="http://lexvo.org/id/iso639-3/lat">lat</nhdl:language>
      <nhdl:language string="lav" uri="http://lexvo.org/id/iso639-3/lav">lav</nhdl:language>
      <nhdl:language string="lez" uri="http://lexvo.org/id/iso639-3/lez">lez</nhdl:language>
      <nhdl:language string="lim" uri="http://lexvo.org/id/iso639-3/lim">lim</nhdl:language>
      <nhdl:language string="lin" uri="http://lexvo.org/id/iso639-3/lin">lin</nhdl:language>
      <nhdl:language string="lit" uri="http://lexvo.org/id/iso639-3/lit">lit</nhdl:language>
      <nhdl:language string="lol" uri="http://lexvo.org/id/iso639-3/lol">lol</nhdl:language>
      <nhdl:language string="loz" uri="http://lexvo.org/id/iso639-3/loz">loz</nhdl:language>
      <nhdl:language string="ltz" uri="http://lexvo.org/id/iso639-3/ltz">ltz</nhdl:language>
      <nhdl:language string="lua" uri="http://lexvo.org/id/iso639-3/lua">lua</nhdl:language>
      <nhdl:language string="lub" uri="http://lexvo.org/id/iso639-3/lub">lub</nhdl:language>
      <nhdl:language string="lug" uri="http://lexvo.org/id/iso639-3/lug">lug</nhdl:language>
      <nhdl:language string="lui" uri="http://lexvo.org/id/iso639-3/lui">lui</nhdl:language>
      <nhdl:language string="lun" uri="http://lexvo.org/id/iso639-3/lun">lun</nhdl:language>
      <nhdl:language string="luo" uri="http://lexvo.org/id/iso639-3/luo">luo</nhdl:language>
      <nhdl:language string="lus" uri="http://lexvo.org/id/iso639-3/lus">lus</nhdl:language>
      <nhdl:language string="mac" uri="http://lexvo.org/id/iso639-3/mkd">mac</nhdl:language>
      <nhdl:language string="mad" uri="http://lexvo.org/id/iso639-3/mad">mad</nhdl:language>
      <nhdl:language string="mag" uri="http://lexvo.org/id/iso639-3/mag">mag</nhdl:language>
      <nhdl:language string="mah" uri="http://lexvo.org/id/iso639-3/mah">mah</nhdl:language>
      <nhdl:language string="mai" uri="http://lexvo.org/id/iso639-3/mai">mai</nhdl:language>
      <nhdl:language string="mak" uri="http://lexvo.org/id/iso639-3/mak">mak</nhdl:language>
      <nhdl:language string="mal" uri="http://lexvo.org/id/iso639-3/mal">mal</nhdl:language>
      <nhdl:language string="man" uri="http://lexvo.org/id/iso639-3/man">man</nhdl:language>
      <nhdl:language string="mao" uri="http://lexvo.org/id/iso639-3/mri">mao</nhdl:language>
      <nhdl:language string="map" uri="http://lexvo.org/id/iso639-5/map">map</nhdl:language>
      <nhdl:language string="mar" uri="http://lexvo.org/id/iso639-3/mar">mar</nhdl:language>
      <nhdl:language string="mas" uri="http://lexvo.org/id/iso639-3/mas">mas</nhdl:language>
      <nhdl:language string="may" uri="http://lexvo.org/id/iso639-3/msa">may</nhdl:language>
      <nhdl:language string="mdf" uri="http://lexvo.org/id/iso639-3/mdf">mdf</nhdl:language>
      <nhdl:language string="mdr" uri="http://lexvo.org/id/iso639-3/mdr">mdr</nhdl:language>
      <nhdl:language string="men" uri="http://lexvo.org/id/iso639-3/men">men</nhdl:language>
      <nhdl:language string="mga" uri="http://lexvo.org/id/iso639-3/mga">mga</nhdl:language>
      <nhdl:language string="mic" uri="http://lexvo.org/id/iso639-3/mic">mic</nhdl:language>
      <nhdl:language string="min" uri="http://lexvo.org/id/iso639-3/min">min</nhdl:language>
      <nhdl:language string="mis" uri="http://lexvo.org/id/iso639-3/mis">mis</nhdl:language>
      <nhdl:language string="mkd" uri="http://lexvo.org/id/iso639-3/mkd">mkd</nhdl:language>
      <nhdl:language string="mkh" uri="http://lexvo.org/id/iso639-5/mkh">mkh</nhdl:language>
      <nhdl:language string="mlg" uri="http://lexvo.org/id/iso639-3/mlg">mlg</nhdl:language>
      <nhdl:language string="mlt" uri="http://lexvo.org/id/iso639-3/mlt">mlt</nhdl:language>
      <nhdl:language string="mnc" uri="http://lexvo.org/id/iso639-3/mnc">mnc</nhdl:language>
      <nhdl:language string="mni" uri="http://lexvo.org/id/iso639-3/mni">mni</nhdl:language>
      <nhdl:language string="mno" uri="http://lexvo.org/id/iso639-5/mno">mno</nhdl:language>
      <nhdl:language string="moh" uri="http://lexvo.org/id/iso639-3/moh">moh</nhdl:language>
      <nhdl:language string="mon" uri="http://lexvo.org/id/iso639-3/mon">mon</nhdl:language>
      <nhdl:language string="mos" uri="http://lexvo.org/id/iso639-3/mos">mos</nhdl:language>
      <nhdl:language string="mri" uri="http://lexvo.org/id/iso639-3/mri">mri</nhdl:language>
      <nhdl:language string="msa" uri="http://lexvo.org/id/iso639-3/msa">msa</nhdl:language>
      <nhdl:language string="mul" uri="http://lexvo.org/id/iso639-3/mul">mul</nhdl:language>
      <nhdl:language string="mun" uri="http://lexvo.org/id/iso639-5/mun">mun</nhdl:language>
      <nhdl:language string="mus" uri="http://lexvo.org/id/iso639-3/mus">mus</nhdl:language>
      <nhdl:language string="mwl" uri="http://lexvo.org/id/iso639-3/mwl">mwl</nhdl:language>
      <nhdl:language string="mwr" uri="http://lexvo.org/id/iso639-3/mwr">mwr</nhdl:language>
      <nhdl:language string="mya" uri="http://lexvo.org/id/iso639-3/mya">mya</nhdl:language>
      <nhdl:language string="myn" uri="http://lexvo.org/id/iso639-5/myn">myn</nhdl:language>
      <nhdl:language string="myv" uri="http://lexvo.org/id/iso639-3/myv">myv</nhdl:language>
      <nhdl:language string="nah" uri="http://lexvo.org/id/iso639-5/nah">nah</nhdl:language>
      <nhdl:language string="nai" uri="http://lexvo.org/id/iso639-5/nai">nai</nhdl:language>
      <nhdl:language string="nap" uri="http://lexvo.org/id/iso639-3/nap">nap</nhdl:language>
      <nhdl:language string="nau" uri="http://lexvo.org/id/iso639-3/nau">nau</nhdl:language>
      <nhdl:language string="nav" uri="http://lexvo.org/id/iso639-3/nav">nav</nhdl:language>
      <nhdl:language string="nbl" uri="http://lexvo.org/id/iso639-3/nbl">nbl</nhdl:language>
      <nhdl:language string="nde" uri="http://lexvo.org/id/iso639-3/nde">nde</nhdl:language>
      <nhdl:language string="ndo" uri="http://lexvo.org/id/iso639-3/ndo">ndo</nhdl:language>
      <nhdl:language string="nds" uri="http://lexvo.org/id/iso639-3/nds">nds</nhdl:language>
      <nhdl:language string="nep" uri="http://lexvo.org/id/iso639-3/nep">nep</nhdl:language>
      <nhdl:language string="new" uri="http://lexvo.org/id/iso639-3/new">new</nhdl:language>
      <nhdl:language string="nia" uri="http://lexvo.org/id/iso639-3/nia">nia</nhdl:language>
      <nhdl:language string="nic" uri="http://lexvo.org/id/iso639-5/nic">nic</nhdl:language>
      <nhdl:language string="niu" uri="http://lexvo.org/id/iso639-3/niu">niu</nhdl:language>
      <nhdl:language string="nld" uri="http://lexvo.org/id/iso639-3/nld">nld</nhdl:language>
      <nhdl:language string="nno" uri="http://lexvo.org/id/iso639-3/nno">nno</nhdl:language>
      <nhdl:language string="nob" uri="http://lexvo.org/id/iso639-3/nob">nob</nhdl:language>
      <nhdl:language string="nog" uri="http://lexvo.org/id/iso639-3/nog">nog</nhdl:language>
      <nhdl:language string="non" uri="http://lexvo.org/id/iso639-3/non">non</nhdl:language>
      <nhdl:language string="nor" uri="http://lexvo.org/id/iso639-3/nor">nor</nhdl:language>
      <nhdl:language string="nqo" uri="http://lexvo.org/id/iso639-3/nqo">nqo</nhdl:language>
      <nhdl:language string="nso" uri="http://lexvo.org/id/iso639-3/nso">nso</nhdl:language>
      <nhdl:language string="nub" uri="http://lexvo.org/id/iso639-5/nub">nub</nhdl:language>
      <nhdl:language string="nwc" uri="http://lexvo.org/id/iso639-3/nwc">nwc</nhdl:language>
      <nhdl:language string="nya" uri="http://lexvo.org/id/iso639-3/nya">nya</nhdl:language>
      <nhdl:language string="nym" uri="http://lexvo.org/id/iso639-3/nym">nym</nhdl:language>
      <nhdl:language string="nyn" uri="http://lexvo.org/id/iso639-3/nyn">nyn</nhdl:language>
      <nhdl:language string="nyo" uri="http://lexvo.org/id/iso639-3/nyo">nyo</nhdl:language>
      <nhdl:language string="nzi" uri="http://lexvo.org/id/iso639-3/nzi">nzi</nhdl:language>
      <nhdl:language string="oci" uri="http://lexvo.org/id/iso639-3/oci">oci</nhdl:language>
      <nhdl:language string="oji" uri="http://lexvo.org/id/iso639-3/oji">oji</nhdl:language>
      <nhdl:language string="ori" uri="http://lexvo.org/id/iso639-3/ori">ori</nhdl:language>
      <nhdl:language string="orm" uri="http://lexvo.org/id/iso639-3/orm">orm</nhdl:language>
      <nhdl:language string="osa" uri="http://lexvo.org/id/iso639-3/osa">osa</nhdl:language>
      <nhdl:language string="oss" uri="http://lexvo.org/id/iso639-3/oss">oss</nhdl:language>
      <nhdl:language string="ota" uri="http://lexvo.org/id/iso639-3/ota">ota</nhdl:language>
      <nhdl:language string="oto" uri="http://lexvo.org/id/iso639-5/oto">oto</nhdl:language>
      <nhdl:language string="paa" uri="http://lexvo.org/id/iso639-5/paa">paa</nhdl:language>
      <nhdl:language string="pag" uri="http://lexvo.org/id/iso639-3/pag">pag</nhdl:language>
      <nhdl:language string="pal" uri="http://lexvo.org/id/iso639-3/pal">pal</nhdl:language>
      <nhdl:language string="pam" uri="http://lexvo.org/id/iso639-3/pam">pam</nhdl:language>
      <nhdl:language string="pan" uri="http://lexvo.org/id/iso639-3/pan">pan</nhdl:language>
      <nhdl:language string="pap" uri="http://lexvo.org/id/iso639-3/pap">pap</nhdl:language>
      <nhdl:language string="pau" uri="http://lexvo.org/id/iso639-3/pau">pau</nhdl:language>
      <nhdl:language string="peo" uri="http://lexvo.org/id/iso639-3/peo">peo</nhdl:language>
      <nhdl:language string="per" uri="http://lexvo.org/id/iso639-3/fas">per</nhdl:language>
      <nhdl:language string="phi" uri="http://lexvo.org/id/iso639-5/phi">phi</nhdl:language>
      <nhdl:language string="phn" uri="http://lexvo.org/id/iso639-3/phn">phn</nhdl:language>
      <nhdl:language string="pli" uri="http://lexvo.org/id/iso639-3/pli">pli</nhdl:language>
      <nhdl:language string="pol" uri="http://lexvo.org/id/iso639-3/pol">pol</nhdl:language>
      <nhdl:language string="pon" uri="http://lexvo.org/id/iso639-3/pon">pon</nhdl:language>
      <nhdl:language string="por" uri="http://lexvo.org/id/iso639-3/por">por</nhdl:language>
      <nhdl:language string="pra" uri="http://lexvo.org/id/iso639-5/pra">pra</nhdl:language>
      <nhdl:language string="pro" uri="http://lexvo.org/id/iso639-3/pro">pro</nhdl:language>
      <nhdl:language string="pus" uri="http://lexvo.org/id/iso639-3/pus">pus</nhdl:language>
      <nhdl:language string="que" uri="http://lexvo.org/id/iso639-3/que">que</nhdl:language>
      <nhdl:language string="raj" uri="http://lexvo.org/id/iso639-3/raj">raj</nhdl:language>
      <nhdl:language string="rap" uri="http://lexvo.org/id/iso639-3/rap">rap</nhdl:language>
      <nhdl:language string="rar" uri="http://lexvo.org/id/iso639-3/rar">rar</nhdl:language>
      <nhdl:language string="roa" uri="http://lexvo.org/id/iso639-5/roa">roa</nhdl:language>
      <nhdl:language string="roh" uri="http://lexvo.org/id/iso639-3/roh">roh</nhdl:language>
      <nhdl:language string="rom" uri="http://lexvo.org/id/iso639-3/rom">rom</nhdl:language>
      <nhdl:language string="ron" uri="http://lexvo.org/id/iso639-3/ron">ron</nhdl:language>
      <nhdl:language string="rum" uri="http://lexvo.org/id/iso639-3/ron">rum</nhdl:language>
      <nhdl:language string="run" uri="http://lexvo.org/id/iso639-3/run">run</nhdl:language>
      <nhdl:language string="rup" uri="http://lexvo.org/id/iso639-3/rup">rup</nhdl:language>
      <nhdl:language string="rus" uri="http://lexvo.org/id/iso639-3/rus">rus</nhdl:language>
      <nhdl:language string="sad" uri="http://lexvo.org/id/iso639-3/sad">sad</nhdl:language>
      <nhdl:language string="sag" uri="http://lexvo.org/id/iso639-3/sag">sag</nhdl:language>
      <nhdl:language string="sah" uri="http://lexvo.org/id/iso639-3/sah">sah</nhdl:language>
      <nhdl:language string="sai" uri="http://lexvo.org/id/iso639-5/sai">sai</nhdl:language>
      <nhdl:language string="sal" uri="http://lexvo.org/id/iso639-5/sal">sal</nhdl:language>
      <nhdl:language string="sam" uri="http://lexvo.org/id/iso639-3/sam">sam</nhdl:language>
      <nhdl:language string="san" uri="http://lexvo.org/id/iso639-3/san">san</nhdl:language>
      <nhdl:language string="sas" uri="http://lexvo.org/id/iso639-3/sas">sas</nhdl:language>
      <nhdl:language string="sat" uri="http://lexvo.org/id/iso639-3/sat">sat</nhdl:language>
      <nhdl:language string="scn" uri="http://lexvo.org/id/iso639-3/scn">scn</nhdl:language>
      <nhdl:language string="sco" uri="http://lexvo.org/id/iso639-3/sco">sco</nhdl:language>
      <nhdl:language string="sel" uri="http://lexvo.org/id/iso639-3/sel">sel</nhdl:language>
      <nhdl:language string="sem" uri="http://lexvo.org/id/iso639-5/sem">sem</nhdl:language>
      <nhdl:language string="sga" uri="http://lexvo.org/id/iso639-3/sga">sga</nhdl:language>
      <nhdl:language string="sgn" uri="http://lexvo.org/id/iso639-5/sgn">sgn</nhdl:language>
      <nhdl:language string="shn" uri="http://lexvo.org/id/iso639-3/shn">shn</nhdl:language>
      <nhdl:language string="sid" uri="http://lexvo.org/id/iso639-3/sid">sid</nhdl:language>
      <nhdl:language string="sin" uri="http://lexvo.org/id/iso639-3/sin">sin</nhdl:language>
      <nhdl:language string="sio" uri="http://lexvo.org/id/iso639-5/sio">sio</nhdl:language>
      <nhdl:language string="sit" uri="http://lexvo.org/id/iso639-5/sit">sit</nhdl:language>
      <nhdl:language string="sla" uri="http://lexvo.org/id/iso639-5/sla">sla</nhdl:language>
      <nhdl:language string="slk" uri="http://lexvo.org/id/iso639-3/slk">slk</nhdl:language>
      <nhdl:language string="slo" uri="http://lexvo.org/id/iso639-3/slk">slo</nhdl:language>
      <nhdl:language string="slv" uri="http://lexvo.org/id/iso639-3/slv">slv</nhdl:language>
      <nhdl:language string="sma" uri="http://lexvo.org/id/iso639-3/sma">sma</nhdl:language>
      <nhdl:language string="sme" uri="http://lexvo.org/id/iso639-3/sme">sme</nhdl:language>
      <nhdl:language string="smi" uri="http://lexvo.org/id/iso639-5/smi">smi</nhdl:language>
      <nhdl:language string="smj" uri="http://lexvo.org/id/iso639-3/smj">smj</nhdl:language>
      <nhdl:language string="smn" uri="http://lexvo.org/id/iso639-3/smn">smn</nhdl:language>
      <nhdl:language string="smo" uri="http://lexvo.org/id/iso639-3/smo">smo</nhdl:language>
      <nhdl:language string="sms" uri="http://lexvo.org/id/iso639-3/sms">sms</nhdl:language>
      <nhdl:language string="sna" uri="http://lexvo.org/id/iso639-3/sna">sna</nhdl:language>
      <nhdl:language string="snd" uri="http://lexvo.org/id/iso639-3/snd">snd</nhdl:language>
      <nhdl:language string="snk" uri="http://lexvo.org/id/iso639-3/snk">snk</nhdl:language>
      <nhdl:language string="sog" uri="http://lexvo.org/id/iso639-3/sog">sog</nhdl:language>
      <nhdl:language string="som" uri="http://lexvo.org/id/iso639-3/som">som</nhdl:language>
      <nhdl:language string="son" uri="http://lexvo.org/id/iso639-5/son">son</nhdl:language>
      <nhdl:language string="sot" uri="http://lexvo.org/id/iso639-3/sot">sot</nhdl:language>
      <nhdl:language string="spa" uri="http://lexvo.org/id/iso639-3/spa">spa</nhdl:language>
      <nhdl:language string="sqi" uri="http://lexvo.org/id/iso639-3/sqi">sqi</nhdl:language>
      <nhdl:language string="srd" uri="http://lexvo.org/id/iso639-3/srd">srd</nhdl:language>
      <nhdl:language string="srn" uri="http://lexvo.org/id/iso639-3/srn">srn</nhdl:language>
      <nhdl:language string="srp" uri="http://lexvo.org/id/iso639-3/srp">srp</nhdl:language>
      <nhdl:language string="srr" uri="http://lexvo.org/id/iso639-3/srr">srr</nhdl:language>
      <nhdl:language string="ssa" uri="http://lexvo.org/id/iso639-5/ssa">ssa</nhdl:language>
      <nhdl:language string="ssw" uri="http://lexvo.org/id/iso639-3/ssw">ssw</nhdl:language>
      <nhdl:language string="suk" uri="http://lexvo.org/id/iso639-3/suk">suk</nhdl:language>
      <nhdl:language string="sun" uri="http://lexvo.org/id/iso639-3/sun">sun</nhdl:language>
      <nhdl:language string="sus" uri="http://lexvo.org/id/iso639-3/sus">sus</nhdl:language>
      <nhdl:language string="sux" uri="http://lexvo.org/id/iso639-3/sux">sux</nhdl:language>
      <nhdl:language string="swa" uri="http://lexvo.org/id/iso639-3/swa">swa</nhdl:language>
      <nhdl:language string="swe" uri="http://lexvo.org/id/iso639-3/swe">swe</nhdl:language>
      <nhdl:language string="syc" uri="http://lexvo.org/id/iso639-3/syc">syc</nhdl:language>
      <nhdl:language string="syr" uri="http://lexvo.org/id/iso639-3/syr">syr</nhdl:language>
      <nhdl:language string="tah" uri="http://lexvo.org/id/iso639-3/tah">tah</nhdl:language>
      <nhdl:language string="tai" uri="http://lexvo.org/id/iso639-5/tai">tai</nhdl:language>
      <nhdl:language string="tam" uri="http://lexvo.org/id/iso639-3/tam">tam</nhdl:language>
      <nhdl:language string="tat" uri="http://lexvo.org/id/iso639-3/tat">tat</nhdl:language>
      <nhdl:language string="tel" uri="http://lexvo.org/id/iso639-3/tel">tel</nhdl:language>
      <nhdl:language string="tem" uri="http://lexvo.org/id/iso639-3/tem">tem</nhdl:language>
      <nhdl:language string="ter" uri="http://lexvo.org/id/iso639-3/ter">ter</nhdl:language>
      <nhdl:language string="tet" uri="http://lexvo.org/id/iso639-3/tet">tet</nhdl:language>
      <nhdl:language string="tgk" uri="http://lexvo.org/id/iso639-3/tgk">tgk</nhdl:language>
      <nhdl:language string="tgl" uri="http://lexvo.org/id/iso639-3/tgl">tgl</nhdl:language>
      <nhdl:language string="tha" uri="http://lexvo.org/id/iso639-3/tha">tha</nhdl:language>
      <nhdl:language string="tib" uri="http://lexvo.org/id/iso639-3/bod">tib</nhdl:language>
      <nhdl:language string="tig" uri="http://lexvo.org/id/iso639-3/tig">tig</nhdl:language>
      <nhdl:language string="tir" uri="http://lexvo.org/id/iso639-3/tir">tir</nhdl:language>
      <nhdl:language string="tiv" uri="http://lexvo.org/id/iso639-3/tiv">tiv</nhdl:language>
      <nhdl:language string="tkl" uri="http://lexvo.org/id/iso639-3/tkl">tkl</nhdl:language>
      <nhdl:language string="tlh" uri="http://lexvo.org/id/iso639-3/tlh">tlh</nhdl:language>
      <nhdl:language string="tli" uri="http://lexvo.org/id/iso639-3/tli">tli</nhdl:language>
      <nhdl:language string="tmh" uri="http://lexvo.org/id/iso639-3/tmh">tmh</nhdl:language>
      <nhdl:language string="tog" uri="http://lexvo.org/id/iso639-3/tog">tog</nhdl:language>
      <nhdl:language string="ton" uri="http://lexvo.org/id/iso639-3/ton">ton</nhdl:language>
      <nhdl:language string="tpi" uri="http://lexvo.org/id/iso639-3/tpi">tpi</nhdl:language>
      <nhdl:language string="tsi" uri="http://lexvo.org/id/iso639-3/tsi">tsi</nhdl:language>
      <nhdl:language string="tsn" uri="http://lexvo.org/id/iso639-3/tsn">tsn</nhdl:language>
      <nhdl:language string="tso" uri="http://lexvo.org/id/iso639-3/tso">tso</nhdl:language>
      <nhdl:language string="tuk" uri="http://lexvo.org/id/iso639-3/tuk">tuk</nhdl:language>
      <nhdl:language string="tum" uri="http://lexvo.org/id/iso639-3/tum">tum</nhdl:language>
      <nhdl:language string="tup" uri="http://lexvo.org/id/iso639-5/tup">tup</nhdl:language>
      <nhdl:language string="tur" uri="http://lexvo.org/id/iso639-3/tur">tur</nhdl:language>
      <nhdl:language string="tut" uri="http://lexvo.org/id/iso639-5/tut">tut</nhdl:language>
      <nhdl:language string="tvl" uri="http://lexvo.org/id/iso639-3/tvl">tvl</nhdl:language>
      <nhdl:language string="twi" uri="http://lexvo.org/id/iso639-3/twi">twi</nhdl:language>
      <nhdl:language string="tyv" uri="http://lexvo.org/id/iso639-3/tyv">tyv</nhdl:language>
      <nhdl:language string="udm" uri="http://lexvo.org/id/iso639-3/udm">udm</nhdl:language>
      <nhdl:language string="uga" uri="http://lexvo.org/id/iso639-3/uga">uga</nhdl:language>
      <nhdl:language string="uig" uri="http://lexvo.org/id/iso639-3/uig">uig</nhdl:language>
      <nhdl:language string="ukr" uri="http://lexvo.org/id/iso639-3/ukr">ukr</nhdl:language>
      <nhdl:language string="umb" uri="http://lexvo.org/id/iso639-3/umb">umb</nhdl:language>
      <nhdl:language string="und" uri="http://lexvo.org/id/iso639-3/und">und</nhdl:language>
      <nhdl:language string="urd" uri="http://lexvo.org/id/iso639-3/urd">urd</nhdl:language>
      <nhdl:language string="uzb" uri="http://lexvo.org/id/iso639-3/uzb">uzb</nhdl:language>
      <nhdl:language string="vai" uri="http://lexvo.org/id/iso639-3/vai">vai</nhdl:language>
      <nhdl:language string="ven" uri="http://lexvo.org/id/iso639-3/ven">ven</nhdl:language>
      <nhdl:language string="vie" uri="http://lexvo.org/id/iso639-3/vie">vie</nhdl:language>
      <nhdl:language string="vol" uri="http://lexvo.org/id/iso639-3/vol">vol</nhdl:language>
      <nhdl:language string="vot" uri="http://lexvo.org/id/iso639-3/vot">vot</nhdl:language>
      <nhdl:language string="wak" uri="http://lexvo.org/id/iso639-5/wak">wak</nhdl:language>
      <nhdl:language string="wal" uri="http://lexvo.org/id/iso639-3/wal">wal</nhdl:language>
      <nhdl:language string="war" uri="http://lexvo.org/id/iso639-3/war">war</nhdl:language>
      <nhdl:language string="was" uri="http://lexvo.org/id/iso639-3/was">was</nhdl:language>
      <nhdl:language string="wel" uri="http://lexvo.org/id/iso639-3/cym">wel</nhdl:language>
      <nhdl:language string="wen" uri="http://lexvo.org/id/iso639-5/wen">wen</nhdl:language>
      <nhdl:language string="wln" uri="http://lexvo.org/id/iso639-3/wln">wln</nhdl:language>
      <nhdl:language string="wol" uri="http://lexvo.org/id/iso639-3/wol">wol</nhdl:language>
      <nhdl:language string="xal" uri="http://lexvo.org/id/iso639-3/xal">xal</nhdl:language>
      <nhdl:language string="xho" uri="http://lexvo.org/id/iso639-3/xho">xho</nhdl:language>
      <nhdl:language string="yao" uri="http://lexvo.org/id/iso639-3/yao">yao</nhdl:language>
      <nhdl:language string="yap" uri="http://lexvo.org/id/iso639-3/yap">yap</nhdl:language>
      <nhdl:language string="yid" uri="http://lexvo.org/id/iso639-3/yid">yid</nhdl:language>
      <nhdl:language string="yor" uri="http://lexvo.org/id/iso639-3/yor">yor</nhdl:language>
      <nhdl:language string="ypk" uri="http://lexvo.org/id/iso639-5/ypk">ypk</nhdl:language>
      <nhdl:language string="zap" uri="http://lexvo.org/id/iso639-3/zap">zap</nhdl:language>
      <nhdl:language string="zbl" uri="http://lexvo.org/id/iso639-3/zbl">zbl</nhdl:language>
      <nhdl:language string="zen" uri="http://lexvo.org/id/iso639-3/zen">zen</nhdl:language>
      <nhdl:language string="zha" uri="http://lexvo.org/id/iso639-3/zha">zha</nhdl:language>
      <nhdl:language string="zho" uri="http://lexvo.org/id/iso639-3/zho">zho</nhdl:language>
      <nhdl:language string="znd" uri="http://lexvo.org/id/iso639-5/znd">znd</nhdl:language>
      <nhdl:language string="zul" uri="http://lexvo.org/id/iso639-3/zul">zul</nhdl:language>
      <nhdl:language string="zun" uri="http://lexvo.org/id/iso639-3/zun">zun</nhdl:language>
      <nhdl:language string="zza" uri="http://lexvo.org/id/iso639-3/zza">zza</nhdl:language>
    </xsl:param>
    
    <!-- lookup table for Month strings to numbers -->
    <xsl:param name="monthLookup">
        <nhdl:month string="01">jan</nhdl:month>
        <nhdl:month string="02">feb</nhdl:month>
        <nhdl:month string="03">mar</nhdl:month>
        <nhdl:month string="04">apr</nhdl:month>
        <nhdl:month string="05">may</nhdl:month>
        <nhdl:month string="06">june</nhdl:month>
        <nhdl:month string="06">jun</nhdl:month>
        <nhdl:month string="07">july</nhdl:month>
        <nhdl:month string="07">jul</nhdl:month>
        <nhdl:month string="08">aug</nhdl:month>
        <nhdl:month string="09">sept</nhdl:month>
        <nhdl:month string="09">sep</nhdl:month>
        <nhdl:month string="10">oct</nhdl:month>
        <nhdl:month string="11">nov</nhdl:month>
        <nhdl:month string="12">dec</nhdl:month>
    </xsl:param>
</xsl:stylesheet>
