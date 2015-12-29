# XMLTranslator
Convinient way to colaborate with translators on the xml files.
Generate csv files from xml, that can be easilly opened by translators in excel. 

#Requirements
Script requires perl interpretter to be installed.

#Converting to csv
Converting xml file to csv requires creating .info file with informations about the structure of the xml document.
.info file consists of searate lines of data, each line describes path to the nested node in xml file that you wish to export.
For example given the xml file:
```
<root>
	<line>test</line>
</root>
```
If one wish to export content of the 'line; node .info file should contain one line:
```
root.line
```

The default name of the .info file is translate.info but you can specify custom one using command line argument.

